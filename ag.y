%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *);
%}
%start program
%token INTEGER
%token DATABASE
%token TEXT_FIELD
%token TEXT_AREA
%token TABLE_NAME
%token NAME
%token IDENTIFIER
%left "=" '(' ')'

%%

program:
                  	  sql {;}
                    | program sql;  
                    ;
sql:	        
            	 	  create_database
            	 	| create_table
            	 	;

create_database: 
                	DATABASE "=" IDENTIFIER { printf("create database");}
                	;

create_table: 
                	TABLE_NAME { printf("create table");}
                	;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
