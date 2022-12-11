#!/bin/sh

unzip bank_transactions.csv.zip

sed 1d bank_transactions.csv > bank_transactions


# QUESTION 1

echo "QUESTION 1)"
echo "Which location has the maximum number of purchases been made?"
echo " "
echo "------------------------------------------------"
echo "row id | location name"
cut -d"," -f 5 bank_transactions | sort | uniq -c | sort -nr | head -1
echo "------------------------------------------------"
#103595 MUMBAI


echo " "

# QUESTION 2

echo "QUESTION 2)"
echo "In the dataset provided, did females spend more than males, or vice versa?"
echo " "
echo "------------------------------------------------"
awk -F"," -v OFMT='%.2f' '{a[$4]+=$9}END{for(i in a) print i,a[i]}' bank_transactions
echo "Males purchase more on average wrt to females."
echo "------------------------------------------------"

echo " "

# QUESTION 3

echo "QUESTION 3)"
echo "Report the customer with the highest average transaction amount in the dataset."
echo " "
echo "------------------------------------------------"
echo "customer id | maximum average transaction amount"
awk -F"," -v OFMT='%.2f' '{(a[$2]+=$9) && (c[$2]+=1)}END{for(i in a){ if (c[i] != 0){print i,(a[i]/c[i])}}}' bank_transactions > Q3
LC_ALL=C sort -k 2nr Q3 | head -1
echo "------------------------------------------------"
