%%%%%%%%%%%%%%%%%%%%%%
% Your code goes here:
%%%%%%%%%%%%%%%%%%%%%%

search(Actions) :-
    initial(Start),
    do_search([[Start, [], []]], Actions).

do_search([[R, _, Actions]|_], Actions) :-
    treasure(R).

do_search([[R, Keys, Actions]|Queue], Solution) :-
    findall([Next, NextKeys, N_Actions],
            do_step(R, Keys, Actions, Next, NextKeys, N_Actions),
            Neighbors),
    append(Queue, Neighbors, NewQueue),
    do_search(NewQueue, Solution).

do_step(R, Keys, Actions, Next, Keys, NewActions) :-
    (door(R, Next); door(Next, R)),
    \+ locked_door(R, Next, _),
    \+ locked_door(Next, R, _),
    append(Actions, [move(R, Next)], NewActions).

do_step(R, Keys, Actions, Next, Keys, NewActions) :-
    (locked_door(R, Next, Color); locked_door(Next, R, Color)),
    member(Color, Keys),
    append(Actions, [move(R, Next)], NewActions).

do_step(R, Keys, Actions, R, [Color|Keys], Actions) :-
    key(R, Color),
    \+ member(Color, Keys).