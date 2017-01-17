%--- people
person(clara).
person(suzie).
person(rose).
person(olivia).

%----husband
husband(robert).
husband(david).
husband(fernando).
husband(frank).

%---color
color(red).
color(yellow).
color(blue).
color(silver).

%---food
food(potatosalad).
food(macaronisalad).
food(snickersalad).
food(coleslaw).

solve :-
	husband(ClaraH), husband(SuzieH), husband(RoseH), husband(OliviaH), all_different([ClaraH, SuzieH, RoseH, OliviaH]),
	color(ClaraC), color(SuzieC), color(RoseC), color(OliviaC), all_different([ClaraC, SuzieC, RoseC, OliviaC]),
	food(ClaraF), food(SuzieF), food(RoseF), food(OliviaF), all_different([ClaraF, SuzieF, RoseF, OliviaF]),
	
	Answers = [[clara, ClaraH, ClaraF, ClaraC], [suzie, SuzieH, SuzieF, SuzieC],[rose, RoseH, RoseF, RoseC], [olivia, OliviaH, OliviaF, OliviaC]],
						
	member([olivia,_,_,blue], Answers),
	(member([_,_,potatosalad,yellow], Answers); member([_,_,coleslaw,yellow], Answers)),
	member([rose,david,macaronisalad,_], Answers),
	\+ member([_,frank,_,yellow], Answers),
	member([_,_,snickersalad,red], Answers),	
	\+ member([olivia,fernando,_,_], Answers),
	member([_,fernando,coleslaw,_], Answers),
	member([suzie,frank,_,_], Answers),
	
	tell(clara, ClaraH, ClaraF, ClaraC),
	tell(suzie, SuzieH, SuzieF, SuzieC),
	tell(rose, RoseH, RoseF, RoseC),
	tell(olivia, OliviaH, OliviaF, OliviaC).
	
	% Rules for all_different
	all_different([H|T]) :- member(H, T), !, fail.
	all_different([_|T]) :- all_different(T).
	all_different([_]).
	
	tell(W, X, Y, Z) :-
		write(W), write(' is married to '), write(X), write(' and brought '), 
		write(Y), write(' in a '), write(Z), write(' container.'), nl.

	
	
