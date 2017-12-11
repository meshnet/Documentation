FILE=N2NP

all: utf8

utf8:
	groff -c -ms -K utf8 -Tutf8 -R protocols/${FILE}.nroff > ${FILE}.term

text: utf8
	cat ${FILE}.term | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" > ${FILE}.txt

html: text
	echo "<html><head><meta charset='UTF-8'></head><body><pre>" > ${FILE}.html
	cat ${FILE}.txt >> ${FILE}.html
	echo "</pre></body></html>" >> ${FILE}.html

clean:
	rm -f ${FILE}.*
