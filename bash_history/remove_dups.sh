#!/bin/bash
set -e

cp .bash_history .bash_history.backup
cat .bash_history | grep -v '^#' | nl | sort -k2 -k 1,1nr | uniq -f1 | sort -n | cut -f2 > .bash_history.tmp
mv .bash_history.tmp .bash_history
