/* MiniJava Lexer usando Token diretamente */
import utils.Token;
import utils.Symbol;
%%

%public
%class MiniJava
%unicode
%line
%column
%type Token  // Faz o yylex() retornar Token

%{
%}

/* ===============================
   Definições de padrões
   =============================== */
WhiteSpace    = [ \t\r\n\f]+
Identifier    = [a-zA-Z_][a-zA-Z0-9_]*
DecInteger    = 0|[1-9][0-9]*
HexInteger    = 0[xX][0-9a-fA-F]+
OctInteger    = 0[0-7]+
IntLiteral    = {DecInteger}|{HexInteger}|{OctInteger}
CharLiteral   = \'([^\'\\]|\\[btnfr\"\'\\])\'
StringLiteral = \"([^\"\\]|\\[btnfr\"\'\\])*\"
Classe = [A-Z][a-zA-Z0-9]*
Colchetes = ([])+
Primitivo = "boolean" | "int"
Array = ({Classe} | {Primitivo}){Colchetes}
%%

/* ===============================
   Regras léxicas
   =============================== */

/* Ignorar espaços e comentários */
{WhiteSpace}          { /* ignora */ }
"//".*                { /* ignora */ }
"/*"([^*]|\*+[^*/])*\*+"/" { /* ignora */ }

/* Palavras-chave */
"class"      { return new Token(Symbol.CLASS, "class", yyline+1, yycolumn+1); }
"extends"    { return new Token(Symbol.EXTENDS, "extends", yyline+1, yycolumn+1); }
"public"     { return new Token(Symbol.PUBLIC, "public", yyline+1, yycolumn+1); }
"static"     { return new Token(Symbol.STATIC, "static", yyline+1, yycolumn+1); }
"native"     { return new Token(Symbol.NATIVE, "native", yyline+1, yycolumn+1); }
"void"       { return new Token(Symbol.VOID, "void", yyline+1, yycolumn+1); }
"main"       { return new Token(Symbol.MAIN, "main", yyline+1, yycolumn+1); }
"return"     { return new Token(Symbol.RETURN, "return", yyline+1, yycolumn+1); }
"if"         { return new Token(Symbol.IF, "if", yyline+1, yycolumn+1); }
"else"       { return new Token(Symbol.ELSE, "else", yyline+1, yycolumn+1); }
"while"      { return new Token(Symbol.WHILE, "while", yyline+1, yycolumn+1); }
"do"         { return new Token(Symbol.DO, "do", yyline+1, yycolumn+1); }
"for"        { return new Token(Symbol.FOR, "for", yyline+1, yycolumn+1); }
"break"      { return new Token(Symbol.BREAK, "break", yyline+1, yycolumn+1); }
"continue"   { return new Token(Symbol.CONTINUE, "continue", yyline+1, yycolumn+1); }
"this"       { return new Token(Symbol.THIS, "this", yyline+1, yycolumn+1); }
"super"      { return new Token(Symbol.SUPER, "super", yyline+1, yycolumn+1); }
"new"        { return new Token(Symbol.NEW, "new", yyline+1, yycolumn+1); }
"null"       { return new Token(Symbol.NULL, null, yyline+1, yycolumn+1); }
"true"       { return new Token(Symbol.TRUE, true, yyline+1, yycolumn+1); }
"false"      { return new Token(Symbol.FALSE, false, yyline+1, yycolumn+1); }

/* Tipos Primitivos */
{Primitivo}  { return new Token(Symbol.PRIMITIVO, yytext(), yyline+1, yycolumn+1); }

/* Tipos Referenciais */
{Array}      { return new Token(Symbol.ARRAY, yytext(), yyline+1, yycolumn+1); }
{Classe}     { return new Token(Symbol.CLASSNAME, yytext(), yyline+1, yycolumn+1); }

/* Literais */
{IntLiteral}    { return new Token(Symbol.INTEGER, Integer.decode(yytext()), yyline+1, yycolumn+1); }
{CharLiteral}   { return new Token(Symbol.CHAR, yytext().charAt(1), yyline+1, yycolumn+1); }
{StringLiteral} { return new Token(Symbol.STRING, yytext().substring(1, yytext().length()-1), yyline+1, yycolumn+1); }

/* Identificadores */
{Identifier}    { return new Token(Symbol.ID, yytext(), yyline+1, yycolumn+1); }

/* Operadores */
"="   { return new Token(Symbol.ATRIBUICAO, "=", yyline+1, yycolumn+1); }
"&&"  { return new Token(Symbol.E, "&&", yyline+1, yycolumn+1); }
"||"  { return new Token(Symbol.OU, "||", yyline+1, yycolumn+1); }
"!"   { return new Token(Symbol.NAO, "!", yyline+1, yycolumn+1); }
"<="  { return new Token(Symbol.MENOR_OU_IGUAL, "<=", yyline+1, yycolumn+1); }
"<"   { return new Token(Symbol.MENOR, "<", yyline+1, yycolumn+1); }
">="  { return new Token(Symbol.MAIOR_OU_IGUAL, ">=", yyline+1, yycolumn+1); }
">"   { return new Token(Symbol.MAIOR, ">", yyline+1, yycolumn+1); }
"=="  { return new Token(Symbol.IGUAL, "==", yyline+1, yycolumn+1); }
"!="  { return new Token(Symbol.DIFERENTE, "!=", yyline+1, yycolumn+1); }
"+"   { return new Token(Symbol.ADICAO, "+", yyline+1, yycolumn+1); }
"-"   { return new Token(Symbol.SUBTRACAO, "-", yyline+1, yycolumn+1); }
"*"   { return new Token(Symbol.MULTIPLICACAO, "*", yyline+1, yycolumn+1); }
"/"   { return new Token(Symbol.DIVISAO, "/", yyline+1, yycolumn+1); }
"?"   { return new Token(Symbol.INTERROGACAO, "?", yyline+1, yycolumn+1); }
":"   { return new Token(Symbol.DOIS_PONTOS, ":", yyline+1, yycolumn+1); }

/* Delimitadores e símbolos */
";"   { return new Token(Symbol.PONTO_VIRGULA, yytext(), yyline+1, yycolumn+1); }
","   { return new Token(Symbol.VIRGULA, yytext(), yyline+1, yycolumn+1); }
"."   { return new Token(Symbol.PONTO, yytext(), yyline+1, yycolumn+1); }
"("   { return new Token(Symbol.ABRE_PARENTESES, yytext(), yyline+1, yycolumn+1); }
")"   { return new Token(Symbol.FECHA_PARENTESES, yytext(), yyline+1, yycolumn+1); }
"{"   { return new Token(Symbol.ABRE_CHAVES, yytext(), yyline+1, yycolumn+1); }
"}"   { return new Token(Symbol.FECHA_CHAVES, yytext(), yyline+1, yycolumn+1); }
"["   { return new Token(Symbol.ABRE_COLCHETES, yytext(), yyline+1, yycolumn+1); }
"]"   { return new Token(Symbol.FECHA_COLCHETES, yytext(), yyline+1, yycolumn+1); }

/* Fim de arquivo */
<<EOF>> { return new Token(Symbol.EOF, "EOF", yyline+1, yycolumn+1); }

/* Erros */
. { System.err.println("Caractere inválido: " + yytext() +
                       " na linha " + (yyline+1) +
                       ", coluna " + (yycolumn+1)); 
    return new Token(Symbol.ERRO, yytext(), yyline+1, yycolumn+1); }
