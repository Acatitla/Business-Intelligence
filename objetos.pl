/* de https://rextester.com/EINDQE35675 */

objeto:- write('{'),read(X), (X='atributo'->atributo),write('}').
a1:- read(X),(X='atributo'-> write(','),atributo;(X='fin'->write(''))).
atributo:- read(X), write('"'), write(X), write('":'),tipoatributo(X),a1. 
tipoatributo(M):- read(X), (X='metodo'->metodo(M); b1(X)).
b1(X):- X='numero'->numero; b2(X).
b2(X):- X='cadena'->cadena; b3(X).
b3(X):- X='objeto'->objeto;write('error').
cadena:- read(X), write('"'), write(X), write('"').
numero:-read(X), write(X).
metodo(M):- write('"function() {'),a2,write(' return '), write(M), write(';}"').
a2:- read(X), (X='decision'->decision;a3(X)).
a3(X):- X='asignacion' -> asignacion;(a4(X)).
a4(X):- X='fin' -> write('');(write('ERROR: '),write(X)).
asignacion:- read(X), write(X), write('='), read(Y), write(Y), write(';'),a2.
decision:- write('if('),condicion,write(')'), verdadero, write('}'),falso,write('}').
condicion:-read(X), write(X).
verdadero:- write('{'),a2.
falso:- write('else {'),a2.
:-objeto.

/* prueba:
atributo. 
minumero.
numero.
10.25.

atributo.
micadena.
cadena.
chales.

atributo.
miobjeto.
objeto.

atributo.
otracadena.
cadena.
xd.
fin.
fin.

resultado esperado: {"minumero":10.25,"micadena":"chales","miobjeto":{"otracadena":"xd"}}
*/


