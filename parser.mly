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
  strings eox { $1 }
  | eox { [] }


;

eox:
  EOF {} | EOL {}

  
str:
  STR { $1 }
  | DQSTR { $1 }
  
strings:
   str { [$1] }
   |  strings str { append $1 [$2] }
;   