#!/bin/bash

dir_list_OPS=(ADD SUB MULT SIN COS)
for i in "${dir_list_OPS[@]}"
do
  mkdir $i
  dir_list_precision=(SINGLE DOUBLE)
  for o in "${dir_list_precision[@]}"
  do
    mkdir $i/$o
    dir_list_round=(RMODE_TRUNCATE RMODE_NEGINF RMODE_POSINF)
    for u in "${dir_list_round[@]}"
    do
    mkdir $i/$o/$u

    done

  done

done
