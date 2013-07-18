#!/bin/sh
# test program to check to date
if [ $# -ne "4" ]; then
	echo "Usage: ${0} txt_input html_input html_head_lines html_tail_lines"
	exit 0
fi
test -e tmp.html && rm -f tmp.html
sed "s/ /\&#160;/g" ${1} > tmp
rm -f ${1}
cp tmp ${1}
rm -f tm
i=1
line_num=$(cat $1 | wc -l)
(head -${3} ${2}
while [ $i -le $line_num ]			# 
do
	printf "\t<h1>" && 
	sed -n "${i}p" $1 | tr -d '\r\n' &&
	printf "</h1>\r\n"
	i=$(($i+1))
done
tail -${4} ${2}) > tmp.html
exit 0 
