%{
    #include "y.tab.h"
    #include <stdlib.h>
    void yyerror(char *);
%}

%%

dbName   				{ return DATABASE; }
tableName   			{ return TABLE_NAME; }
[a-zA-Z][a-zA-Z0-9]+    { 
						   return IDENTIFIER; 
						}
[1-9][0-9]*				{
              			  return INTEGER;
           				}

[:] 					{
               			 return *yytext;
           				}

[ \t\n]      			 ;

.        			   ;

%%

int yywrap(void) {
    return 1;
}
