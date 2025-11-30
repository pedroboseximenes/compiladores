import utils.Token;
import utils.Symb;
%%
%public
%class Calculadora
%standalone
%line
%column
%type Token 

Digito        = [0-9]
Numero        = {Digito}+(\.{Digito}+)?
Operadores    = (\+|\-|\*|\/|\/\/|\*\*)
AbreParenteses = \(
FechaParenteses = \)
WhiteSpace    = [ \t\r\n\f]+

%%
{WhiteSpace}          { /* ignora */ }

{Numero} { 
   return new Token(Symb.NUMERO, yytext(), yyline+1, yycolumn+1); 
}

{Operadores} { 
     return new Token(Symb.OPERACAO, yytext(), yyline+1, yycolumn+1);
}

{AbreParenteses} { 
     return new Token(Symb.ABRE_PARENTESES, yytext(),  yyline+1, yycolumn+1);
}

{FechaParenteses} { 
    return new Token(Symb.FECHA_PARENTESES, yytext(), yyline+1, yycolumn+1);
}

<<EOF>> { return new Token(Symb.EOF, "EOF", yyline+1, yycolumn+1); }

. { System.err.println("Caractere inválido: " + yytext() +
                       " na linha " + (yyline+1) +
                       ", coluna " + (yycolumn+1)); 
    return new Token(Symb.ERRO, yytext(), yyline+1, yycolumn+1); }
