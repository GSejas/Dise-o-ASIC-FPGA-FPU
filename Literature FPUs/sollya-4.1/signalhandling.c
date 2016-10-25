/*

  Copyright 2013 by

  Laboratoire d'Informatique de Paris 6, equipe PEQUAN,
  UPMC Universite Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France,

  Contributors Ch. Lauter

  christoph.lauter@ens-lyon.org

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

#define _POSIX_SOURCE

#include "signalhandling.h"
#include <stdlib.h>
#include <signal.h>
#include <setjmp.h>
#include <stdio.h>

extern jmp_buf recoverEnvironment;
extern int handlingCtrlC;
extern int lastHandledSignal;
extern int recoverEnvironmentReady;
extern int exitInsteadOfRecover;
extern int libraryMode;

int blockedSignalCounter = 0;

int sollyaFprintf(FILE *fd, const char *format, ...);

void signalHandler(int i) {

  switch (i) {
  case SIGINT:
    handlingCtrlC = 1;
    lastHandledSignal = HANDLING_SIGINT;
    break;
  case SIGSEGV:
    lastHandledSignal = HANDLING_SIGSEGV;
    break;
  case SIGBUS:
    lastHandledSignal = HANDLING_SIGBUS;
    break;
  case SIGFPE:
    lastHandledSignal = HANDLING_SIGFPE;
    break;
  case SIGPIPE:
    lastHandledSignal = HANDLING_SIGPIPE;
    break;
  default:
    sollyaFprintf(stderr,"Error: must handle an unknown signal.\n");
    exit(1);
  }
  if (recoverEnvironmentReady) {
    if (exitInsteadOfRecover) {
      sollyaFprintf(stderr,"Error: the recover environment has not been initialized. Exiting.\n");
      exit(1);
    }
    longjmp(recoverEnvironment,1);
  }
}

void initSignalHandler() {
  sigset_t mask;
  struct sigaction action;

  blockedSignalCounter = 0;

  if (libraryMode) return;

  action.sa_handler = signalHandler;
  action.sa_flags = 0;
  sigemptyset(&(action.sa_mask));
  sigaddset(&(action.sa_mask),SIGINT);
  sigaddset(&(action.sa_mask),SIGSEGV);
  sigaddset(&(action.sa_mask),SIGBUS);
  sigaddset(&(action.sa_mask),SIGFPE);
  sigaddset(&(action.sa_mask),SIGPIPE);
  sigaction(SIGINT, &action, NULL);
  sigaction(SIGSEGV, &action, NULL);
  sigaction(SIGBUS, &action, NULL);
  sigaction(SIGFPE, &action, NULL);
  sigaction(SIGPIPE, &action, NULL);

  sigemptyset(&mask);
  sigaddset(&mask,SIGINT);
  sigaddset(&mask,SIGSEGV);
  sigaddset(&mask,SIGBUS);
  sigaddset(&mask,SIGFPE);
  sigaddset(&mask,SIGPIPE);
  sigprocmask(SIG_UNBLOCK, &mask, NULL);
}

void blockSignals() {
  sigset_t mask;

  blockedSignalCounter = 0;

  if (libraryMode) return;

  sigemptyset(&mask);
  sigaddset(&mask,SIGINT);
  sigaddset(&mask,SIGSEGV);
  sigaddset(&mask,SIGBUS);
  sigaddset(&mask,SIGFPE);
  sigaddset(&mask,SIGPIPE);
  sigprocmask(SIG_BLOCK, &mask, NULL);
}

void initSignalHandlerCounted() {
  blockedSignalCounter--;
  if (blockedSignalCounter < 0) blockedSignalCounter = 0;
  if (blockedSignalCounter == 0) initSignalHandler();
}

void blockSignalsCounted() {
  if (blockedSignalCounter < 0) blockedSignalCounter = 0;
  if (blockedSignalCounter == 0) blockSignals();
  blockedSignalCounter++;
}




