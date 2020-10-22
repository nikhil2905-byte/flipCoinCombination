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

echo "Singlet Combination"
echo "******************"

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

echo "Doublet Combination"
echo "=================="

declare -A doublets
hh=0
ht=0
th=0
tt=0
for (( i=0;i<n;i++ ))
do
	result="$( flipCoin )""$( flipCoin )"
	doublets[$i]=$result;
	if [ "$result" == "HEADHEAD" ]
   then
		hh=$((hh+1));
	elif [ "$result" == "HEADTAIL" ]
	then
		ht=$((ht+1));
	elif [ "$result" == "TAILHEAD" ]
	then
		th=$((th+1));
	else
		tt=$((tt+1));
	fi
done
echo "Generated doublets:" ${doublets[@]};
echo "Percentage of HH = $((hh*100/n))";
echo "Percentage of TT = $((tt*100/n))";
echo "Percentage of HT = $((ht*100/n))";
echo "Percentage of TH = $((th*100/n))";
