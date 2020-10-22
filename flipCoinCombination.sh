#!/bin/bash -x

echo "Welcome to Flip Coin Combination Problem"

   randomCheck=$((RANDOM%2))
   if [ $randomCheck -eq 0 ]
   then
      echo "HEAD"
   else
      echo "TAIL"
   fi
