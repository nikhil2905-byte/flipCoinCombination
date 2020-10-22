#!/bin/bash -x

echo "Welcome to Flip Coin Combination Problem"
function flipCoin(){
   randomCheck=$((RANDOM%2))
   if [ $randomCheck -eq 0 ]
   then
      echo "HEAD"
   else
      echo "TAIL"
   fi
}

declare -A singlets
declare -A  winingCombination
isHead="HEAD"
read -p "Enter number of times to flip the coin " n;
for (( i=0;i<n;i++ ))
do
	result="$( flipCoin )"
	singlets[$i]=$result;
	if [ "$result" == "$isHead" ]
	then
		heads=$((heads+1));
	else
		tails=$((tails+1));
	fi
done
echo "Generated Singlets :" ${singlets[@]}
echo "Percentage of Singlets";
echo "Percentage of Heads :" $((heads*100/n));
echo "Percentage of Tails :" $((tails*100/n));
echo "WiningCombination[H] :" $((heads*100/n))
echo "WiningCombination[T] :" $((tails*100/n))
