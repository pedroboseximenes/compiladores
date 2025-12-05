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
IntLiteral    = {DecInteger}
%%

/* ===============================
   Regras léxicas
   =============================== */

/* Ignorar espaços e comentários */
{WhiteSpace}          { /* ignora */ }

/* Palavras-chave */
"class"     { return criarSymbol(sym.CLASS, "class", yyline+1, yycolumn+1); }
"extends"   { return criarSymbol(sym.EXTENDS, "extends", yyline+1, yycolumn+1); }
"public"    { return criarSymbol(sym.PUBLIC, "public", yyline+1, yycolumn+1); }
"static"    { return criarSymbol(sym.STATIC, "static", yyline+1, yycolumn+1); }
"void"      { return criarSymbol(sym.VOID, "void", yyline+1, yycolumn+1); }
"main"      { return criarSymbol(sym.MAIN, "main", yyline+1, yycolumn+1); }
"return"    { return criarSymbol(sym.RETURN, "return", yyline+1, yycolumn+1); }
"if"        { return criarSymbol(sym.IF, "if", yyline+1, yycolumn+1); }
"else"      { return criarSymbol(sym.ELSE, "else", yyline+1, yycolumn+1); }
"while"     { return criarSymbol(sym.WHILE, "while", yyline+1, yycolumn+1); }
"true"      { return criarSymbol(sym.TRUE, true, yyline+1, yycolumn+1); }
"false"     { return criarSymbol(sym.FALSE, false, yyline+1, yycolumn+1); }
"this"      { return criarSymbol(sym.THIS, "this", yyline+1, yycolumn+1); }
"new"       { return criarSymbol(sym.NEW, "new", yyline+1, yycolumn+1); }

/* Tipos Primitivos */
"int"      { return criarSymbol(sym.INT, "int", yyline+1, yycolumn+1); }
"boolean"  { return criarSymbol(sym.BOOLEAN, "boolean", yyline+1, yycolumn+1); }
"String"   { return criarSymbol(sym.STRING, "String", yyline+1, yycolumn+1); }

/* Literais */
{IntLiteral}  { return criarSymbol(sym.INTEGER, Integer.parseInt(yytext()), yyline+1, yycolumn+1); }

/* Identificadores */
{Identifier}  { return criarSymbol(sym.ID, yytext(), yyline+1, yycolumn+1); }

/* Operadores */
"="    { return criarSymbol(sym.ATRIBUICAO, "=", yyline+1, yycolumn+1); }
"&&"   { return criarSymbol(sym.E, "&&", yyline+1, yycolumn+1); }
"<"    { return criarSymbol(sym.MENOR, "<", yyline+1, yycolumn+1); }
"+"    { return criarSymbol(sym.ADICAO, "+", yyline+1, yycolumn+1); }
"-"    { return criarSymbol(sym.SUBTRACAO, "-", yyline+1, yycolumn+1); }
"*"    { return criarSymbol(sym.MULTIPLICACAO, "*", yyline+1, yycolumn+1); }
"!"    { return criarSymbol(sym.NAO, "!", yyline+1, yycolumn+1); }

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