let print_results results =
  let f x = Printf.printf "Hello %s\n" x in
  List.iter f results;;

      
let inner =
  let lexbuf = Lexing.from_channel stdin in
  try
    while true do
      print_string "looping\n";
      let result = Parser.main Lexer.token lexbuf in print_results result;
      print_newline(); flush stdout
    done
  with Lexer.Eof ->
    exit 0
;;

    (*
let _ =
  try
    inner
  with Lexer.Eof ->
    exit 0
     *)

  inner ;
  exit 0 ;;
    
