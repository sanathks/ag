%{
    #include "y.tab.h"
    #include <stdlib.h>
    void yyerror(char *);
%}
%s ELEMENT
%%

dbName   				{ return DATABASE; }
tableName   			{ return TABLE_NAME; }
"[a-zA-Z][a-zA-Z0-9]+"  { return IDENTIFIER; }


"[()=+,]"				{ return *yytext; }
"<\?.*\?>" 				{ ;} 
"<[a-z]+>" 				{ return *yytext; }
"</[a-z]+>"				{ return *yytext; }
"[^><]+" 				{ return *yytext; }
"[0-9]+"   			   { yylval = atoi(yytext); return INTEGER;}
[ \t]      			   ;
.        			   ;

%%

int yywrap(void) {
    return 1;
}
