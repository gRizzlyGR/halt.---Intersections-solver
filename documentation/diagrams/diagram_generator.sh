#!/bin/bash
s="_object_xref_diagram"

for filename in ./*.dot; do
	s1="${filename/$s/''}"
#	echo $s1
	s2="${s1/dot/''}"
#	echo $s2
	dot -Tpdf $filename > ""$s2"pdf"
done
