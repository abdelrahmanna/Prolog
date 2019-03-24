
% conc works the same way as append
conc( [], L, L).
conc( [X| L1], L2, [X| L3]) :-
	conc( L1, L2, L3).

%delete last three element of a list
delete_last_three(Original_List,New_list):-
	conc(New_list,[_,_,_],Original_List).

%deleting first three element using conc
delete_first_three_conc(Original_List,New_list):-
	conc([_,_,_],New_list,Original_List).

%deleting the first and last three elements in a list
delete(Original_List,New_list):-
	conc([_,_,_],L,Original_List),
	delete_last_three(L,New_list).

%% implementing the membre rule
member1( X, [X| _]).
member1( X, [_| Tail]) :-
	member1( X, Tail).

% get last item of a list
last_item(X,[X]).
last_item(X, [_|L]):-
	member1(X,L),
	item(X,L).
%get last item using conc
last_item1(X,L):-
	conc(_,[X],L).

%reverse concatination
conc1( L1, L2, L3):-
	conc(L2,L1,L3).
%adding element in the first position to the list
add(X, L,[X|L]).

%adding element in the end of the list with conc
add_end(X,L,L1):-
	conc(L,X,L1).

%adding element in the end of the list wihtout conc
add_end1(X,[], [X]).
add_end1(X, [H|Tail], [H|Tail2]):-
	add_end1(X,Tail,Tail2).

%delete first occurance of an element
del( X, [X| Tail], Tail).
del( X, [Y| Tail], [Y|Tail1]) :-
	del( X, Tail, Tail1).


%delete all occurances of an element
del_all(_, [], []).
del_all( X, [X| Tail], T):-
	del_all(X,Tail,T).
del_all( X, [Y| Tail], [Y|Tail1]) :-
	del_all(X,Tail,Tail1).


%delete all occurances of an element

del_all(_, [], []).
del_all( X, [X| Tail], T):-
	del_all(X,Tail,T).
del_all( X, [Y| Tail], [Y|Tail1]) :-
	del_all(X,Tail,Tail1).

%reversing a list

re([],[]).
re([x],[x]).
re([H|L],L1):-
	re(L,L2),
	conc(L2, [H], L1).

%get all permution of a list
permutation1([],[]).
permutation1([ X| L], P):-
          permutation1( L, L1),
	  del( X, P, L1).

%get all sublists of alist
sublist( S, L) :-
	conc( _, L2, L), conc( S, _, L2).

palindrome( List):-
	re(List,L),
	sublist(List, L),
	sublist(L,List).






























