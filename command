yacc -d ag.y && lex ag.l && gcc lex.yy.c y.tab.c -o ag && ./ag < dsl.xml
