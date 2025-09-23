import utils.Token;
import utils.Symbol;
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
   return new Token(Symbol.NUMERO, yyline+1, yycolumn+1); 
}

{Operadores} { 
     return new Token(Symbol.OPERACAO, yyline+1, yycolumn+1);
}

{AbreParenteses} { 
     return new Token(Symbol.ABRE_PARENTESES, yyline+1, yycolumn+1);
}

{FechaParenteses} { 
    return new Token(Symbol.FECHA_PARENTESES, yyline+1, yycolumn+1);
}

<<EOF>> { return new Token(Symbol.EOF, yyline+1, yycolumn+1); }

. { System.err.println("Caractere inválido: " + yytext() +
                       " na linha " + (yyline+1) +
                       ", coluna " + (yycolumn+1)); 
    return new Token(Symbol.ERRO, yyline+1, yycolumn+1); }
