main:
	lex calc.l
	yacc calc.y
	cc y.tab.c
