/*****************************************************************************

		Copyright (c) My Company

 Project:  LAB_16
 FileName: LAB_16.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

DOMAINS
	name, sex = symbol.
	
PREDICATES
	%family(name, name, name).
	%find_grandparents(name, name, name, name, name).
	
	
	parent(name, name).
	sex(name, symbol).
	
	find_grandparent(name, name, symbol, symbol).


CLAUSES
	parent("Ann", "Slava").
	parent("Ann", "Vadim").
	parent("Liza", "Dasha").
	parent("Elena", "Katya").
	parent("Marya", "Elena").
	
	parent("Vasya", "Slava").
	parent("Vasya", "Vadim").
	parent("Slava", "Dasha").
	parent("Vadim", "Katya").
	parent("Ivan", "Elena").
	
	sex("Ann", female).
	sex("Liza", female).
	sex("Elena", female).
	sex("Marya", female).
	
	sex("Vasya", male).
	sex("Slava", male).
	sex("Vadim", male).
	sex("Ivan", male).
	
	
	
	
	find_grandparent(Child, Grandparent, Sex_gr, Sex_p) :-
		parent(Parent, Child),
		sex(Parent, Sex_p),
		parent(Grandparent, Parent),
		sex(Grandparent, Sex_gr).
	
	
	/*family("Vasya", "Ann", "Slava").
	family("Vasya", "Ann", "Vadim").
	family("Slava", "Liza", "Dasha").
	family("Vadim", "Elena", "Katya").
	family("Ivan", "Marya", "Elena").
	
	find_grandparents(Child, Grandma_ma, Grandpa_ma, Grandma_pa, Grandpa_pa) :-	
		family(Dad, Mom, Child), 
		family(Grandpa_pa, Grandma_pa, Dad),
		family(Grandpa_ma, Grandma_ma, Mom).*/

	
GOAL
	%all grandmothers
	%find_grandparent("Dasha", Grandma, female, _).
	
	%all grandfathers
	%find_grandparent("Katya", Grandpa, male, _).
	
	%all grandfathers and %all_grandmothers
	%find_grandparent("Katya", Grandparent, _, _).
	
	%all grandmother from mom
	%find_grandparent("Katya", Grandma, female, female).
	
	%all grandparents from mom
	%find_grandparent("Katya", Grandparent, _, female).
	
