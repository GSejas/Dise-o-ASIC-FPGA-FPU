#!/bin/bash
find "../../../front_end/db/SINGLE/" -name "*.v" | grep "Mult" > file_list
find "." -name "*.v" >> file_list
