# Documentation/Protocols

## Build prerequisites

1. [OPTIONAL/RECOMMENDED] Use a true linux/unix install. *GNUwin32* and similar software collections may not behave correctly.

2. Make sure that `groff` is correctly installed. (`apt install groff` or similar) *As per issue #11*

## Build

```
$ make text html
groff -c -ms -Kutf8 -Tutf8 -R src/N2NP.nroff > N2NP.term
cat N2NP.term | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" > N2NP.txt
echo "<html><head><meta charset='UTF-8'></head><body><pre>" > N2NP.html
cat N2NP.txt >> N2NP.html
echo "</pre></body></html>" >> N2NP.html
```