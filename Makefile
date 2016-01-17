.PHONY : all clean

BIN = shlex

.PHONY : all
all : $(BIN)

.PHONY : clean
clean :
	rm -f $(BIN) lexer.ml parser.ml parser.mli *.cmi *.cmo


#parser.ml parser.mli : parser.mly lexer.ml
parser.ml parser.mli : parser.mly
	ocamlyacc parser.mly


parser.cmi : parser.mli
	ocamlc -c parser.mli

lexer.ml : lexer.mll parser.cmi
	ocamllex lexer.mll

lexer.cmi lexer.cmo : lexer.ml
	ocamlc -c lexer.ml

parser.cmo : parser.ml
	ocamlc -c parser.ml

$(BIN).cmi $(BIN).cmo : $(BIN).ml
	ocamlc -c $(BIN).ml

$(BIN) : lexer.cmo parser.cmo $(BIN).cmo
	ocamlc -o $(BIN) lexer.cmo parser.cmo $(BIN).cmo
