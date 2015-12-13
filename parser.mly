%{
open List
%}
%token EOF
%token EOL
%token <string> DQSTR
%token <string> STR
%start main
%type  <string list> main
%%
main:
  strings EOF { $1 }
  | strings EOL { $1 }
  | EOF { ["Im done"] }

;
str:
  STR { $1 }
  | DQSTR { $1 }
  
strings:
   str { [$1] }
   |  strings str { append $1 [$2] }
;   