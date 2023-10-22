#!/bin/bash
# a vous de découvrir le flag a partir de la sortie du script donné dans l'énoncé
flag=$(cat $1)
funk_fake() {
	printf "$1" |&  xxd -p 
}
funk_butcher() {
	declare -i x
	x=0
	meat="$1"
	while [[ -n "$meat" ]] ; do
		eat[$x]="${meat:0:8}"
		meat=$(echo "$meat" | sed 's;^'"$(echo ${meat:0:8})"';;')
		x+=1
	done
}
a="(01100101 01101100 01110010 00100000 01000001 01110000 01110011 01101001 01110101 00111011 01100001 01101100 01101110 01111000 01100001 00111101 11000011 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01100010 00111101 11000011 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01100110 00111101 11000011 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01100111 00111101 11000011 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01101001 00111101 11000011 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01101010 00111101 11000011 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01101110 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01101111 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01110001 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01110010 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01110110 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01110111 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01111001 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01111010 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01000001 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01000010 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01000100 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01000101 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01001001 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01001010 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01001100 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01001101 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01001110 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01010000 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01010001 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01010010 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01010011 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01010100 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01010110 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01011000 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01011001 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01011010 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 00110000 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 00110001 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 00110011 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 00110100 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 00111000 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 00111001 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010)"
A='(01100100 01100011 01100001 01100101 00101101 00100000 01100001 01101100 01101110 01111000 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01100011 00111101 11000011 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01100100 00111101 11000011 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01100101 00111101 11000011 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01101000 00111101 11000011 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01101011 00111101 11000011 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01101100 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01101101 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01110000 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01110011 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01110100 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01110101 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01111000 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01111011 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01111101 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01011111 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01000011 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01000110 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01000111 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01001000 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01001011 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01001111 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 01010101 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 01010111 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 00110010 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 00110101 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001 00111011 01100001 01101100 01101110 01111000 00110110 00111101 11000011 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10101001 00111011 01100001 01101100 01101110 01111000 00110111 00111101 11000011 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 11000011 00100010 01110000 01110011 01101001 01110101 01011011 01011101 00100010 10101000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 11000010 00100000 10100000 10101001)'
eval a=$a
eval A=$A
for i in {0..1489} ; do
        muh="$muh ${A[$i]} ${a[$i]}"
done

muh=$(echo $muh | perl -lape '$_=pack"(B8)*",@F')
echo $muh
eval $muh
declare -i b=0
for code in $(echo $flag  | sed -E 's#(.)#\1 #g') ; do
        encode[$b]="${paslinux[$code]}"
	b+=1
done
jenaigros=/
declare -i n=0
until [[ "$b" = "$n" ]] ; do
	jenaigros="$jenaigros$( printf -- "${encode[$n]}")/" 
	n+=1
done
first="$jenaigros"
second=$(funk_fake "$first" | sed 's/ //g')
second=$(echo $second | sed 's/ //g')
funk_butcher $second
echo ${eat[*]}