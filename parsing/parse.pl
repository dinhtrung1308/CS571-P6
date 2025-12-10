
%%%%%%%%%%%%%%%%%
% Your code here:
%%%%%%%%%%%%%%%%%

parse(X) :- lines(X, []).
lines(I, R) :-
    line(I, [';'|R1]),
    lines(R1, R).
lines(I, R) :-
    line(I, R).

line(I, R) :-
    number(I, [','|R1]),
    line(R1, R).
line(I, R) :-
    number(I, R).

number(I, R) :-
    digit(I, R1),
    number(R1, R).
number(I, R) :-
    digit(I, R).

digit(['0'|R], R).
digit(['1'|R], R).
digit(['2'|R], R).
digit(['3'|R], R).
digit(['4'|R], R).
digit(['5'|R], R).
digit(['6'|R], R).
digit(['7'|R], R).
digit(['8'|R], R).
digit(['9'|R], R).

% Example execution:
% ?- parse(['3', '2', ',', '0', ';', '1', ',', '5', '6', '7', ';', '2']).
% true.
% ?- parse(['3', '2', ',', '0', ';', '1', ',', '5', '6', '7', ';', '2', ',']).
% false.
% ?- parse(['3', '2', ',', ';', '0']).
% false.
