{
open Parser        (* The type token is defined in parser.mli *)
       (* exception Eof *)
}
rule token = parse
  [' ' '\t']     { token lexbuf }     (* skip blanks *)
  | ['\n' ]        { EOL }
  | ['a'-'z' 'A'-'Z']+ as lxm { STR lxm }
  | eof            { EOF }
