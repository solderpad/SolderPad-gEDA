#!/bin/sh

awk -F'	' '
	BEGIN {
		print "{\n	 \"items\"\: ["
		sep = ""
	}
	/^[^\.]/ {
		printf sep
		printf "		{\n"
		printf "			\"designator\": \"%s\",\n", $1
		printf "			\"value\": \"%s\",\n", $3
		printf "			\"description\": \"%s (%s)\"\n", $2, $4
		printf "		}"
		sep = ",\n"
	}
	END {
		print "\n	]\n}"
	}
'
