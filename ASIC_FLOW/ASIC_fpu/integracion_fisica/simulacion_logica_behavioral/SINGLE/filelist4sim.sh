#!/bin/bash
find "../../front_end/source" -name "*.v" > file_list1
find $PWD -name "*.v" >> file_list1
find "../../front_end/source" -name "*.v" > file_list2
find $PWD -name "*.v" >> file_list2

