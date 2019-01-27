#!/bin/bash

#fetch the output from nginx welcome page and save it in a temp file
curl -s http://localhost > output

#remove html tags
sed -i -r 's/<(.|\n)*?>//' output

#count unique words, sort them according to the count and save it in a temp file  
cat output | tr ":;{},." "@" | sed 's/@//g'| tr -s ' ' '\n' | sort | uniq -c | sort -nr | awk '{ print $2 }' > list_of_words

#Read the highest occurence 
echo "Word that occurs most on the page: " `head -n 1 list_of_words`

#remove temp files
rm list_of_words
rm output
