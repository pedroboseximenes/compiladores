%%
%public
%class Calculadora
%standalone

Digito        = [0-9]
Numero        = {Digito}+(\.{Digito}+)?
Operadores    = (\+|\-|\*|\/|\/\/|\*\*)
AbreParenteses = \(
FechaParenteses = \)
Espaco        = [ \t]
NovaLinha     = \n

%%

{Numero} { 
    System.out.println("NUMERO: " + yytext()); 
}

{Operadores} { 
    System.out.println("OPERADOR: " + yytext()); 
}

{AbreParenteses} { 
    System.out.println("ABRE_PARENTESES: " + yytext()); 
}

{FechaParenteses} { 
    System.out.println("FECHA_PARENTESES: " + yytext()); 
}
