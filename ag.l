%{
    #include "y.tab.h"
    #include <stdlib.h>
    void yyerror(char *);
%}

%%

dbName   				{ return DATABASE; }
tableName   			{ return TABLE_NAME; }
[a-zA-Z][a-zA-Z0-9]+    { 
						    yylval.value = yytext;
						   return IDENTIFIER; 
						}
[1-9][0-9]*				{
              			  yylval.num = atoi(yytext);
              			  return INTEGER;
           				}

[-()<>=+*/;{}.] 		{
               			 return *yytext;
           				}

[ \t]      			   ;

.        			   ;

%%

int yywrap(void) {
    return 1;
}
