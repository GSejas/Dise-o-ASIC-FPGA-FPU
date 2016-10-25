/*

  Copyright 2006-2013 by

  Laboratoire de l'Informatique du Parallelisme,
  UMR CNRS - ENS Lyon - UCB Lyon 1 - INRIA 5668

  and by

  Laboratoire d'Informatique de Paris 6, equipe PEQUAN,
  UPMC Universite Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France,

  Contributors Ch. Lauter, S. Chevillard

  christoph.lauter@ens-lyon.org
  sylvain.chevillard@ens-lyon.org

  This software is a computer program whose purpose is to provide an
  environment for safe floating-point code development. It is
  particularily targeted to the automatized implementation of
  mathematical floating-point libraries (libm). Amongst other features,
  it offers a certified infinity norm, an automatic polynomial
  implementer and a fast Remez algorithm.

  This software is governed by the CeCILL-C license under French law and
  abiding by the rules of distribution of free software.  You can  use,
  modify and/ or redistribute the software under the terms of the CeCILL-C
  license as circulated by CEA, CNRS and INRIA at the following URL
  "http://www.cecill.info".

  As a counterpart to the access to the source code and  rights to copy,
  modify and redistribute granted by the license, users are provided only
  with a limited warranty  and the software's author,  the holder of the
  economic rights,  and the successive licensors  have only  limited
  liability.

  In this respect, the user's attention is drawn to the risks associated
  with loading,  using,  modifying and/or developing or reproducing the
  software by the user in light of its specific status of free software,
  that may mean  that it is complicated to manipulate,  and  that  also
  therefore means  that it is reserved for developers  and  experienced
  professionals having in-depth computer knowledge. Users are therefore
  encouraged to load and test the software's suitability as regards their
  requirements in conditions enabling the security of their systems and/or
  data to be ensured and,  more generally, to use and operate it in the
  same conditions as regards security.

  The fact that you are presently reading this means that you have had
  knowledge of the CeCILL-C license and that you accept its terms.

  This program is distributed WITHOUT ANY WARRANTY; without even the
  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "chain.h"
#include "assignment.h"
#include "expression.h"
#include "execute.h"
#include "general.h"


chain *addEntry(chain *symTbl, char *name, void *value, void * (*copyValue) (void *)) {
  entry *newEntry;

  if (containsEntry(symTbl,name)) return symTbl;

  newEntry = (entry *) safeMalloc(sizeof(entry));
  newEntry->name = (char *) safeCalloc(strlen(name)+1,sizeof(char));
  strcpy(newEntry->name,name);
  newEntry->value = copyValue(value);
  symTbl = addElement(symTbl,newEntry);
  return symTbl;
}

int containsEntry(chain *symTbl, char *name) {
  chain *curr;

  curr = symTbl;
  while (curr != NULL) {
    if (strcmp(((entry *) (curr->value))->name,name) == 0) return 1;
    curr = curr->next;
  }

  return 0;
}

void *getEntry(chain *symTbl, char *name, void * (*copyValue) (void *)) {
  chain *curr;
  void *result;

  result = NULL;
  curr = symTbl;
  while (curr != NULL) {
    if (strcmp(((entry *) (curr->value))->name,name) == 0) {
      result = copyValue(((entry *) curr->value)->value);
      break;
    }
    curr = curr->next;
  }

  return result;
}

void freeEntry(void *e, void (*f) (void *)) {
  f(((entry *) e)->value);
  safeFree(((entry *) e)->name);
  safeFree(e);
}


chain *removeEntry(chain *symTbl, char *name, void (*f) (void *)) {
  chain *curr, *prev, *newSymTbl;

  curr = symTbl; prev = NULL;
  while (curr != NULL) {
    if (strcmp(((entry *) (curr->value))->name,name) == 0) {
      if ((prev == NULL) && (curr->next == NULL)) {
	newSymTbl = NULL;
      } else {
	if (prev == NULL) {
	  newSymTbl = curr->next;
	} else {
	  prev->next = curr->next;
	  newSymTbl = symTbl;
	}
      }
      freeEntry(((entry *) curr->value),f);
      safeFree(curr);
      return newSymTbl;
    }
    prev = curr;
    curr = curr->next;
  }

  return symTbl;
}


void freeSymbolTable(chain *symTbl, void (*f) (void *)) {
  if (symTbl != NULL) {
    if (symTbl->next != NULL) freeSymbolTable(symTbl->next,f);
    freeEntry(symTbl->value,f);
    safeFree(symTbl);
  }
}


void freeNothing(void *thing) {
  UNUSED_PARAM(thing); return;
}

void freeDeclaredSymbolTable(chain *declSymTbl, void (*f) (void *)) {
  chain *curr;

  curr = declSymTbl;
  while (curr != NULL) {
    freeSymbolTable((chain *) (curr->value), f);
    curr->value = NULL;
    curr = curr->next;
  }

  freeChain(declSymTbl, freeNothing);
}

chain *pushFrame(chain *declSymTbl) {

  return addElement(declSymTbl, NULL);

}

chain *popFrame(chain *declSymTbl, void (*f) (void *)) {
  chain *newDeclSymTbl;

  if (declSymTbl == NULL) return NULL;

  newDeclSymTbl = declSymTbl->next;

  freeSymbolTable((chain *) (declSymTbl->value), f);

  safeFree(declSymTbl);

  return newDeclSymTbl;
}

chain *declareNewEntry(chain *declSymTbl, char *name, void *value, void * (*copyValue) (void *)) {
  chain *newValue;

  if (declSymTbl == NULL) return NULL;

  if (containsEntry((chain *) (declSymTbl->value), name)) return declSymTbl;

  newValue = addEntry((chain *) (declSymTbl->value), name, value, copyValue);

  declSymTbl->value = newValue;

  return declSymTbl;
}

chain *replaceDeclaredEntry(chain *declSymTbl, char *name, void *value, void * (*copyValue) (void *), void (*freeValue) (void *)) {
  chain *curr;
  chain *newValue;

  if (declSymTbl == NULL) return NULL;

  curr = declSymTbl;
  while (curr != NULL) {
    if (containsEntry((chain *) (curr->value), name)) {
      newValue = removeEntry((chain *) (curr->value), name, freeValue);
      curr->value = newValue;
      newValue = addEntry((chain *) (curr->value), name, value, copyValue);
      curr->value = newValue;
      break;
    }
    curr = curr->next;
  }

  return declSymTbl;
}

int containsDeclaredEntry(chain *declSymTbl, char *name) {
  chain *curr;

  curr = declSymTbl;
  while (curr != NULL) {
    if (containsEntry((chain *) (curr->value), name)) return 1;
    curr = curr->next;
  }

  return 0;
}

void *getDeclaredEntry(chain *declSymTbl, char *name, void * (*copyValue) (void *)) {
  chain *curr;

  curr = declSymTbl;
  while (curr != NULL) {
    if (containsEntry((chain *) (curr->value), name)) return getEntry((chain *) (curr->value), name, copyValue);
    curr = curr->next;
  }

  return NULL;
}



chain *assignDeclaredEntry(chain *declSymTbl, char *name, void *value, void * (*copyValue) (void *), void (*freeValue) (void *)) {
  chain *newDeclSymTbl;

  if (containsDeclaredEntry(declSymTbl, name))
    newDeclSymTbl = replaceDeclaredEntry(declSymTbl, name, value, copyValue, freeValue);
  else
    newDeclSymTbl = declareNewEntry(declSymTbl, name, value, copyValue);

  return newDeclSymTbl;
}

int performListPrependOnEntry(chain *symTbl, char *ident, node *tree) {
  chain *curr, *newArgs;
  node *oldNode, *newNode;
  int okay;
  int oldChecked, addedChecked, newChecked;
  size_t neededSize;

  oldChecked = 0;
  newChecked = 0;
  addedChecked = 0;
  if ((tree->nodeType == MEMREF) && (tree->child1 == tree->child2)) addedChecked = 1;

  okay = 0;
  curr = symTbl;
  while (curr != NULL) {
    if (strcmp(((entry *) (curr->value))->name,ident) == 0) {
      oldNode = (node *) (((entry *) curr->value)->value);
      if ((oldNode->nodeType == MEMREF) && (oldNode->child1 == oldNode->child2)) oldChecked = 1;
      newChecked = oldChecked && addedChecked;
      while (1) {
	if (oldNode->nodeType != MEMREF) break; else { if (!newChecked) oldNode->child2 = NULL; }
	if (oldNode->libFunDeriv > 1) break;
	oldNode = oldNode->child1;
      }
      switch (oldNode->nodeType) {
      case MEMREF:
	if (!newChecked) oldNode->child2 = NULL;
	if (oldNode->libFunDeriv > 1) {
	  if ((oldNode->child1->nodeType == LIST) ||
	      (oldNode->child1->nodeType == FINALELLIPTICLIST)) {
	    newArgs = addElement(copyChainWithoutReversal(oldNode->child1->arguments, copyThingOnVoid), tree);
	    newNode = (node *) safeMalloc(sizeof(node));
	    newNode->nodeType = oldNode->child1->nodeType;
	    newNode->argArray = NULL;
	    newNode->argArraySize = 0;
	    newNode->argArrayAllocSize = 0;
	    newNode->arguments = newArgs;
	    newNode = addMemRef(newNode);
	    if (newChecked && (newNode->nodeType == MEMREF)) {
	      newNode->child2 = newNode->child1;
	    }
	    ((entry *) curr->value)->value = newNode;
	    freeThing(oldNode);
	    okay = 1;
	  } else {
	    newNode = deepCopyThing(oldNode);
	    if ((newNode->nodeType == LIST) ||
		(newNode->nodeType == FINALELLIPTICLIST)) {
	      freeThing(oldNode);
	      newNode->arguments = addElement(newNode->arguments, tree);
	      newNode->argArray = NULL;
	      newNode->argArraySize = 0;
	      newNode->argArrayAllocSize = 0;
	      ((entry *) curr->value)->value = newNode;
	      newNode = addMemRef(newNode);
	      if (newChecked && (newNode->nodeType == MEMREF)) {
		newNode->child2 = newNode->child1;
	      }
	      okay = 1;
	    } else {
	      freeThing(newNode);
	    }
	  }
	}
	break;
      case LIST:
      case FINALELLIPTICLIST:
	oldNode->arguments = addElement(oldNode->arguments, tree);
	if (oldNode->argArray != NULL) {
	  neededSize = ((size_t) (oldNode->argArraySize + 1)) * sizeof(node *);
	  if (neededSize <= (oldNode->argArrayAllocSize)) {
	    oldNode->argArraySize++;
	    (oldNode->argArray)[(oldNode->argArraySize - 1) - 0] = tree;
	  } else {
	    if ((neededSize <= ((size_t) (2 * oldNode->argArrayAllocSize))) &&
		(((size_t) (2 * oldNode->argArrayAllocSize)) <= ((size_t) SOLLYA_MAX_ARG_ARRAY_ALLOC_SIZE)) &&
		(((size_t) (2 * oldNode->argArrayAllocSize)) > ((size_t) 0))) {
	      oldNode->argArrayAllocSize = (size_t) (2 * oldNode->argArrayAllocSize);
	      oldNode->argArray = safeRealloc(oldNode->argArray, oldNode->argArrayAllocSize);
	      oldNode->argArraySize++;
	      (oldNode->argArray)[(oldNode->argArraySize - 1) - 0] = tree;
	    } else {
	      safeFree(oldNode->argArray);
	      oldNode->argArray = NULL;
	      oldNode->argArraySize = 0;
	      oldNode->argArrayAllocSize = 0;
	    }
	  }
	}
	okay = 1;
	break;
      default:
	okay = 0;
	break;
      }
      break;
    }
    curr = curr->next;
  }

  return okay;
}

int performListPrependOnDeclaredEntry(chain *declSymTbl, char *name, node *tree) {
  chain *curr;

  curr = declSymTbl;
  while (curr != NULL) {
    if (containsEntry((chain *) (curr->value), name)) return performListPrependOnEntry((chain *) (curr->value), name, tree);
    curr = curr->next;
  }

  return 0;
}

int performListTailOnEntry(chain *symTbl, char *ident) {
  chain *curr, *newArgs;
  node *oldNode, *newNode;
  int okay;
  int oldChecked;

  oldChecked = 0;

  okay = 0;
  curr = symTbl;
  while (curr != NULL) {
    if (strcmp(((entry *) (curr->value))->name,ident) == 0) {
      oldNode = (node *) (((entry *) curr->value)->value);
      if ((oldNode->nodeType == MEMREF) && (oldNode->child1 == oldNode->child2)) oldChecked = 1;
      while (1) {
	if (oldNode->nodeType != MEMREF) break;
	if (oldNode->libFunDeriv > 1) break;
	oldNode = oldNode->child1;
      }
      switch (oldNode->nodeType) {
      case MEMREF:
	if (oldNode->libFunDeriv > 1) {
	  if (((oldNode->child1->nodeType == LIST) ||
	       (oldNode->child1->nodeType == FINALELLIPTICLIST)) &&
	      ((oldNode->child1->arguments != NULL) &&
	       (oldNode->child1->arguments->next != NULL) &&
	       (oldNode->child1->arguments->next != NULL))) {
	    newArgs = copyChainWithoutReversal(oldNode->child1->arguments->next, copyThingOnVoid);
	    newNode = (node *) safeMalloc(sizeof(node));
	    newNode->nodeType = oldNode->child1->nodeType;
	    newNode->arguments = newArgs;
	    newNode->argArray = NULL;
	    newNode->argArraySize = 0;
	    newNode->argArrayAllocSize = 0;
	    newNode = addMemRef(newNode);
	    if (oldChecked && (newNode->nodeType == MEMREF)) {
	      newNode->child2 = newNode->child1;
	    }
	    ((entry *) curr->value)->value = newNode;
	    freeThing(oldNode);
	    okay = 1;
	  } else {
	    newNode = deepCopyThing(oldNode);
	    if (((newNode->nodeType == LIST) ||
		 (newNode->nodeType == FINALELLIPTICLIST)) &&
		((oldNode->child1->arguments != NULL) &&
		 (oldNode->child1->arguments->next != NULL) &&
		 (oldNode->child1->arguments->next->next != NULL))) {
	      freeThing(oldNode);
	      freeThing((node *) (newNode->arguments->value));
	      newArgs = newNode->arguments->next;
	      safeFree(newNode->arguments);
	      newNode->arguments = newArgs;
	      newNode->argArray = NULL;
	      newNode->argArraySize = 0;
	      newNode->argArrayAllocSize = 0;
	      newNode = addMemRef(newNode);
	      if (oldChecked && (newNode->nodeType == MEMREF)) {
		newNode->child2 = newNode->child1;
	      }
	      ((entry *) curr->value)->value = newNode;
	      okay = 1;
	    } else {
	      freeThing(newNode);
	    }
	  }
	}
	break;
      case LIST:
      case FINALELLIPTICLIST:
	if ((oldNode->arguments != NULL) &&
	    (oldNode->arguments->next != NULL) &&
	    (oldNode->arguments->next->next != NULL)) {
	  freeThing((node *) (oldNode->arguments->value));
	  newArgs = oldNode->arguments->next;
	  safeFree(oldNode->arguments);
	  oldNode->arguments = newArgs;
	  if (oldNode->argArray != NULL) {
	    if (oldNode->argArraySize >= 2) {
	      oldNode->argArraySize--;
	    } else {
	      safeFree(oldNode->argArray);
	      oldNode->argArray = NULL;
	      oldNode->argArraySize = 0;
	      oldNode->argArrayAllocSize = 0;
	    }
	  }
	  okay = 1;
	} else {
	  okay = 0;
	}
	break;
      default:
	okay = 0;
	break;
      }
      break;
    }
    curr = curr->next;
  }

  return okay;
}

int performListTailOnDeclaredEntry(chain *declSymTbl, char *name) {
  chain *curr;

  curr = declSymTbl;
  while (curr != NULL) {
    if (containsEntry((chain *) (curr->value), name)) return performListTailOnEntry((chain *) (curr->value), name);
    curr = curr->next;
  }

  return 0;
}
