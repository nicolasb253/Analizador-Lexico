%{
	int yylineno;
	int err;
	#define MAIN	1;
	#define INT	2;
	#define FLOAT	3;
	#define CHAR	4;
	#define VAR	5;
	#define PYC	6;
	
	
%}

letra [a-zA-Z]
numero[0-9]
variable{letra}|({letra}|{numero})*

%%
main[ ]*[(]void[)][ |\n]*[{]  return MAIN
(int[ ]*) return INT
(float[ ]*) return FLOAT
(char[ ]*) return CHAR
{variable}[ ]* return VAR
[;] return PYC
\n yylineno++;
%%
int main(){
	int token;
	token = yylex();
	
	while(token){
		if (token==1){
			printf("MAIN\nParent-a=( VOID Parent-c= )\nInicio={\n");
		}
		if (token==2){
			token = yylex();
			if (token == 5){
				printf("INT Id= ");
				while (token==5){
					printf("%s", yytext);
					if(token == 5){
						token = yylex();
						printf("%d", token);
					}
				}
				if (token==6){
					printf(" Punto-coma=;\n");
				}
				if (token!=6){
					printf("\n");
				}
			}
		}
		if (token==3){
			token = yylex();
			if (token == 5){
				printf("INT Id= ");
				while (token==5){
					printf("%s", yytext);
					if(token == 5){
						token = yylex();
					}
				}
				if (token==6){
					printf(" Punto-coma=;\n");
				}
				if (token!=6){
					printf("\n");
				}
			}
		}
		if (token==4){
			token = yylex();
			if (token == 5){
				printf("INT Id= ");
				while (token==5){
					printf("%s", yytext);
					if(token == 5){
						token = yylex();
					}
				}
				if (token==6){
					printf(" Punto-coma=;\n");
				}
				if (token!=6){
					printf("\n");
				}
			}
		}
		token = yylex();
		
	}
	return 0;
}
