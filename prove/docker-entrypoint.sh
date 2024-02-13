#!/bin/sh
set -e
touch bbatch_commands
mkdir bdp lang
echo "help" >> bbatch_commands
echo "crp repo bdp lang SOFTWARE" >> bbatch_commands
echo "op repo" >> bbatch_commands
for mch;
do
  echo "af ${mch}" >> bbatch_commands
done
echo "m pr" >> bbatch_commands
/opt/atelierb-free-4.7.1p1/startBB -i=bbatch_commands
rm bbatch_commands
rm -rf bdp lang