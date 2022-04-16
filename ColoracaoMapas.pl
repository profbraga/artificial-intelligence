%####################################################################
% Aula 13/04/2022 - Prof. Braga
% Atividade 3 e 4: Pintando o mapa da Australia
% Resolução utilizando o Prolog. Para executar, utilizei o SWISH
% https://swish.swi-prolog.org/
% Apesar da atividade ter que ser desenvolvida em R, usei esse 
% caso para mostrar uma resolução com o Prolog.
% Para executar o código, basta colocar na consulta a seguinte
% instrução:
% pintando_mapa_australia(WA, NT, SA, NSW, V, Q, T, ACT).
%####################################################################

pintando_mapa_australia(WA, NT, SA, NSW, V, Q, T, ACT) :-
     pintar_diferente_de(WA , NT ), pintar_diferente_de(WA , SA ), 
     pintar_diferente_de(NT , SA ), pintar_diferente_de(NT , Q  ), 
     pintar_diferente_de(Q  , SA ), pintar_diferente_de(Q  , NSW), 
     pintar_diferente_de(NSW, SA ), pintar_diferente_de(NSW, V  ), 
     pintar_diferente_de(V  , SA ), pintar_diferente_de(T  , V  ),
     pintar_diferente_de(ACT, NSW).

pintar_diferente_de(A, B) :- diferente_de(A, B).
pintar_diferente_de(A, B) :- diferente_de(B, A).

diferente_de(azul, vermelho).
diferente_de(azul, verde).
diferente_de(azul, amarelo).

diferente_de(verde, vermelho).
diferente_de(verde, amarelo).

diferente_de(vermelho, amarelo).