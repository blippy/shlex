%{
open List
%}
%token EOF
%token EOL
%token <string> STR
%start main
%type  <string list> main
%%
main:
  strings EOF { $1 }
  | strings EOL { $1 }
  | EOF { ["Im done"] }

;
strings:
   STR { [$1] }
   |  strings STR { append $1 [$2] }
;   