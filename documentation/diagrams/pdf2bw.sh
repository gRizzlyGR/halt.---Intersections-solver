#!/bin/bash

for filename in ./*.pdf; do

	gs -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibilityLevel=1.4 -dAutoRotatePages=/Non  -dNOPAUSE -dBATCH  -sOutputFile=""$filename"_2" $filename

	mv $filename ""$filename".color"
	mv ""$filename"_2" $filename
done


