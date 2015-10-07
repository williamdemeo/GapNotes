gap> HELP(">");
gap> HELP(">");
gap> HELP(">");
gap> HELP(">");
gap> (1,2,3)=(2,3,1);
true
gap> HELP(">");
gap> cubed:= x -> x^3;
function( x ) ... end
gap> cubed(5);
125
gap> HELP(">");
gap> HELP("sets");
gap> HELP("normalizer");
gap> HELP("centralizer");
gap> HELP("lattice");
gap> HELP(">");
gap> HELP("<");
gap> HELP("ref: t h s");
Help: Showing `Reference: The Help System'
gap> HELP(">");
gap> HELP("<");
gap> HELP("<");
gap> HELP("Tutorial:");
gap> HELP(">");
gap> HELP("Tutorial:A First Session with GAP");
Help: Showing `Tutorial: A First Session with GAP'
gap> HELP(">");
gap> HELP(">");
gap> HELP("Tutorial:A First Session with GAP");
Help: Showing `Tutorial: A First Session with GAP'
gap> HELP("centralizer");
gap> 1
> ;
1
gap> HELP("centralizer:1");
Help: None of the available books matches (try: '?books').
gap> HELP("centralizer");
gap> HELP("1");
gap> (1:31);
Syntax error: ) expected
(1:31);
  ^
gap> (1,...,31);
Syntax error: expression expected
(1,...,31);
    ^
gap> (1..31);
Syntax error: ) expected
(1..31);
   ^
gap> (1,..,31);
Syntax error: expression expected
(1,..,31);
    ^
gap> [1..31];
[ 1 .. 31 ]
gap> Size([1..31]);
31
gap> Elements([1..31]);
[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 
  22, 23, 24, 25, 26, 27, 28, 29, 30, 31 ]
gap> HELP("permutation");
Help: Showing `Reference: Permutation'
gap> Permutation([1..31]);
List Element: <list>[2] must have an assigned value at
D := arg[2];
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit
> ;
gap> HELP("permutation");
Help: Showing `Reference: Permutation'
gap> Permutation([1..31],[1..31]);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `POW' on 2 arguments called from
act( pnt, g ) called from
PermutationOp( g, D, act ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Permutation((1..31),[1..31]);
Syntax error: ) expected
Permutation((1..31),[1..31]);
               ^
gap> Permutation((1,..,31),[1..31]);
Syntax error: expression expected
Permutation((1,..,31),[1..31]);
                ^
gap> HELP("perm");
Help: Showing `AutomGrp (not loaded): Perm'
gap> HELP("sequence");
gap> HELP("list");
gap> HELP("Tutorial:A First Session with GAP");
Help: Showing `Tutorial: A First Session with GAP'
gap> HELP(">");
gap> HELP(">");
gap> HELP(">");
gap> HELP(">");
gap> HELP(">");
gap> HELP(">");
gap> HELP(">");
gap> HELP(">");
gap> quit;
