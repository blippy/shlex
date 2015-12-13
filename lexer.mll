{
open Parser        (* The type token is defined in parser.mli *)
open String
exception Eof
}

let delim = '\n'
let word = ['a'-'z''A'-'Z'] ['a'-'z''A'-'Z''0'-'9''_']*
let number = ['0'-'9']+
let punct = ['.' ',' '?' '-']
let ws = ['\t'' ''\n']
let gentext = [^'\r''\n'' ''\t']
let dqstr = '\"' [^'"']* '\"'
(* let dqstr = "foo" *)

rule token = parse
  [' ' '\t']     { token lexbuf }     (* skip blanks *)
  | ['\n' ]        { EOL }
  | dqstr as dqs { DQSTR (sub dqs 1 ((length dqs) -2)) }
  | gentext+ as lxm { STR lxm }
  | eof            { raise Eof }
