%{
#include <stdio.h>

static void yyerror(const char *s) {
  fputs(s, stderr);
  fputs("\n", stderr);
}

static int yywrap(void) {
  return 1;
}

%}

%union {
  double double_value;
}

%type <double_value> expr
%token <double_value> NUM
%token ADD SUB NL


%%

program : statement
        | program statement
        ;

statement : expr NL
            {
              fprintf(stdout, "%g\n", $1);
            }
          ;

expr : NUM
     | expr ADD NUM
     | expr SUB NUM
     ;

%%


#include "lex.yy.c"

int main() {
  yyparse();
}
