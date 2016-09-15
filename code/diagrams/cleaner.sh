#!/bin/bash

for filename in ./*.dot; do
	grep -v 'label="Gener' $filename > ""$filename"_2"
	rm $filename
	mv ""$filename"_2" $filename
done
