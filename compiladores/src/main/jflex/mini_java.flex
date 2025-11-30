/* MiniJava Lexer usando Token diretamente */
import java_cup.runtime.Symbol;
import com.compiladores.sym;

%%

%public
%class MiniJava
%unicode
%line
%column
%cup
%{
   public Symbol criarSymbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

   public Symbol criarSymbol(int type, Object value, int linha, int coluna) {
        return new Symbol(type, linha, coluna, value);
    }
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
"class"      { return criarSymbol(sym.CLASS, "class", yyline+1, yycolumn+1); }
"extends"    { return criarSymbol(sym.EXTENDS, "extends", yyline+1, yycolumn+1); }
"public"     { return criarSymbol(sym.PUBLIC, "public", yyline+1, yycolumn+1); }
"static"     { return  criarSymbol(sym.STATIC, "static", yyline+1, yycolumn+1); }
"native"     { return  criarSymbol(sym.NATIVE, "native", yyline+1, yycolumn+1); }
"void"       { return  criarSymbol(sym.VOID, "void", yyline+1, yycolumn+1); }
"main"       { return  criarSymbol(sym.MAIN, "main", yyline+1, yycolumn+1); }
"return"     { return  criarSymbol(sym.RETURN, "return", yyline+1, yycolumn+1); }
"if"         { return  criarSymbol(sym.IF, "if", yyline+1, yycolumn+1); }
"else"       { return  criarSymbol(sym.ELSE, "else", yyline+1, yycolumn+1); }
"while"      { return  criarSymbol(sym.WHILE, "while", yyline+1, yycolumn+1); }
"do"         { return  criarSymbol(sym.DO, "do", yyline+1, yycolumn+1); }
"for"        { return  criarSymbol(sym.FOR, "for", yyline+1, yycolumn+1); }
"break"      { return  criarSymbol(sym.BREAK, "break", yyline+1, yycolumn+1); }
"continue"   { return  criarSymbol(sym.CONTINUE, "continue", yyline+1, yycolumn+1); }
"this"       { return  criarSymbol(sym.THIS, "this", yyline+1, yycolumn+1); }
"super"      { return  criarSymbol(sym.SUPER, "super", yyline+1, yycolumn+1); }
"new"        { return criarSymbol(sym.NEW, "new", yyline+1, yycolumn+1); }
"null"       { return criarSymbol(sym.NULL, null, yyline+1, yycolumn+1); }
"true"       { return criarSymbol(sym.TRUE, true, yyline+1, yycolumn+1); }
"false"      { return criarSymbol(sym.FALSE, false, yyline+1, yycolumn+1); }

/* Tipos Primitivos */
{Primitivo}  { return criarSymbol(sym.PRIMITIVO, yytext(), yyline+1, yycolumn+1); }

/* Tipos Referenciais */
{Array}      { return  criarSymbol(sym.ARRAY, yytext(), yyline+1, yycolumn+1); }
{Classe}     { return  criarSymbol(sym.CLASSNAME, yytext(), yyline+1, yycolumn+1); }

/* Literais */
{IntLiteral}    { return  criarSymbol(sym.INTEGER, Integer.decode(yytext()), yyline+1, yycolumn+1); }
{CharLiteral}   { return  criarSymbol(sym.CHAR, yytext().charAt(1), yyline+1, yycolumn+1); }
{StringLiteral} { return  criarSymbol(sym.STRING, yytext().substring(1, yytext().length()-1), yyline+1, yycolumn+1); }

/* Identificadores */
{Identifier}    { return  criarSymbol(sym.ID, yytext(), yyline+1, yycolumn+1); }

/* Operadores */
"="   { return  criarSymbol(sym.ATRIBUICAO, "=", yyline+1, yycolumn+1); }
"&&"  { return  criarSymbol(sym.E, "&&", yyline+1, yycolumn+1); }
"||"  { return  criarSymbol(sym.OU, "||", yyline+1, yycolumn+1); }
"!"   { return  criarSymbol(sym.NAO, "!", yyline+1, yycolumn+1); }
"<="  { return  criarSymbol(sym.MENOR_OU_IGUAL, "<=", yyline+1, yycolumn+1); }
"<"   { return  criarSymbol(sym.MENOR, "<", yyline+1, yycolumn+1); }
">="  { return  criarSymbol(sym.MAIOR_OU_IGUAL, ">=", yyline+1, yycolumn+1); }
">"   { return  criarSymbol(sym.MAIOR, ">", yyline+1, yycolumn+1); }
"=="  { return  criarSymbol(sym.IGUAL, "==", yyline+1, yycolumn+1); }
"!="  { return  criarSymbol(sym.DIFERENTE, "!=", yyline+1, yycolumn+1); }
"+"   { return  criarSymbol(sym.ADICAO, "+", yyline+1, yycolumn+1); }
"-"   { return  criarSymbol(sym.SUBTRACAO, "-", yyline+1, yycolumn+1); }
"*"   { return  criarSymbol(sym.MULTIPLICACAO, "*", yyline+1, yycolumn+1); }
"/"   { return  criarSymbol(sym.DIVISAO, "/", yyline+1, yycolumn+1); }
"?"   { return  criarSymbol(sym.INTERROGACAO, "?", yyline+1, yycolumn+1); }
":"   { return  criarSymbol(sym.DOIS_PONTOS, ":", yyline+1, yycolumn+1); }

/* Delimitadores e símbolos */
";"   { return  criarSymbol(sym.PONTO_VIRGULA, yytext(), yyline+1, yycolumn+1); }
","   { return  criarSymbol(sym.VIRGULA, yytext(), yyline+1, yycolumn+1); }
"."   { return  criarSymbol(sym.PONTO, yytext(), yyline+1, yycolumn+1); }
"("   { return  criarSymbol(sym.ABRE_PARENTESES, yytext(), yyline+1, yycolumn+1); }
")"   { return  criarSymbol(sym.FECHA_PARENTESES, yytext(), yyline+1, yycolumn+1); }
"{"   { return  criarSymbol(sym.ABRE_CHAVES, yytext(), yyline+1, yycolumn+1); }
"}"   { return  criarSymbol(sym.FECHA_CHAVES, yytext(), yyline+1, yycolumn+1); }
"["   { return  criarSymbol(sym.ABRE_COLCHETES, yytext(), yyline+1, yycolumn+1); }
"]"   { return  criarSymbol(sym.FECHA_COLCHETES, yytext(), yyline+1, yycolumn+1); }

/* Fim de arquivo */
<<EOF>> { return  criarSymbol(sym.EOF, "EOF", yyline+1, yycolumn+1); }

/* Erros */
. { System.err.println("Caractere inválido: " + yytext() +
                       " na linha " + (yyline+1) +
                       ", coluna " + (yycolumn+1)); 
    return  criarSymbol(sym.ERRO, yytext(), yyline+1, yycolumn+1); }
