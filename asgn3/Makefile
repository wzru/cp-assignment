calc: calc.l calc.y
	flex calc.l
	bison -d calc.y
	gcc -o $@ calc.tab.c lex.yy.c

clean: 
	-rm calc *.tab.* lex.yy.c