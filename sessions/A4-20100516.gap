gap> A5 := AlternatingGroup(5);
Alt( [ 1 .. 5 ] )
gap> CClasses := ConjugacyClassesSubgroups(A5);
[ Group( () )^G, Group( [ (2,3)(4,5) ] )^G, Group( [ (3,4,5) ] )^G, Group( [ (2,3)(4,5), (2,4)(3,5) ] )^G, Group( [ (1,2,3,4,5) ] )^G, 
  Group( [ (3,4,5), (1,2)(4,5) ] )^G, Group( [ (1,2,3,4,5), (2,5)(3,4) ] )^G, Group( [ (2,3)(4,5), (2,4)(3,5), (3,4,5) ] )^G, 
  AlternatingGroup( [ 1 .. 5 ] )^G ]
gap> List(CClasses, Size);
[ 1, 15, 10, 5, 6, 10, 6, 5, 1 ]
gap> CClasses[1];
Group( () )^G
gap> CClasses[2];
Group( [ (2,3)(4,5) ] )^G
gap> Display(Elements(CClasses[2]));
[ Group( [ (2,3)(4,5) ] ), Group( [ (2,4)(3,5) ] ), Group( [ (2,5)(3,4) ] ), Group( [ (1,2)(4,5) ] ), Group( [ (1,2)(3,4) ] ), 
  Group( [ (1,2)(3,5) ] ), Group( [ (1,3)(4,5) ] ), Group( [ (1,3)(2,4) ] ), Group( [ (1,3)(2,5) ] ), Group( [ (1,4)(3,5) ] ), 
  Group( [ (1,4)(2,3) ] ), Group( [ (1,4)(2,5) ] ), Group( [ (1,5)(3,4) ] ), Group( [ (1,5)(2,3) ] ), Group( [ (1,5)(2,4) ] ) ]
gap> CClasses[2][2];
Group([ (2,4)(3,5) ])
gap> Display(Elements(CClasses[2][1]));
[ (), (2,3)(4,5) ]
gap> Display(Elements(CClasses[4]));
[ Group( [ (2,3)(4,5), (2,4)(3,5) ] ), Group( [ (1,2)(4,5), (1,4)(2,5) ] ), Group( [ (1,2)(3,4), (1,3)(2,4) ] ), 
  Group( [ (1,5)(2,3), (1,3)(2,5) ] ), Group( [ (1,5)(3,4), (1,4)(3,5) ] ) ]
gap> Display(Elements(CClasses[4]));
[ Group( [ (2,3)(4,5), (2,4)(3,5) ] ), Group( [ (1,2)(4,5), (1,4)(2,5) ] ), Group( [ (1,2)(3,4), (1,3)(2,4) ] ), 
  Group( [ (1,5)(2,3), (1,3)(2,5) ] ), Group( [ (1,5)(3,4), (1,4)(3,5) ] ) ]
gap> Intersection(CClasses[4][1],CClasses[4][2]);
Group(())
gap> Intersection(CClasses[4][1],CClasses[4][1]);
Group([ (2,3)(4,5), (2,4)(3,5) ])
gap> Display(Elements(CClasses[4][1]));
[ (), (2,3)(4,5), (2,4)(3,5), (2,5)(3,4) ]
gap> Union(CClasses[4]);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `LENGTH' on 1 arguments called from
Length( arg ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit
> ;
gap> Union(Elements(CClasses[4]));
[ (), (2,3)(4,5), (2,4)(3,5), (2,5)(3,4), (1,2)(4,5), (1,2)(3,4), (1,2)(3,5), (1,3)(4,5), (1,3)(2,4), (1,3)(2,5), (1,4)(3,5), 
  (1,4)(2,3), (1,4)(2,5), (1,5)(3,4), (1,5)(2,3), (1,5)(2,4) ]
gap> Union(Elements(CClasses[4]));
[ (), (2,3)(4,5), (2,4)(3,5), (2,5)(3,4), (1,2)(4,5), (1,2)(3,4), (1,2)(3,5), (1,3)(4,5), (1,3)(2,4), (1,3)(2,5), (1,4)(3,5), 
  (1,4)(2,3), (1,4)(2,5), (1,5)(3,4), (1,5)(2,3), (1,5)(2,4) ]
gap> Size(Union(Elements(CClasses[4])));
16
gap> Display(Elements(CClasses[4][2]));
[ (), (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ]
gap> Display(Elements(CClasses[4][1]));
[ (), (2,3)(4,5), (2,4)(3,5), (2,5)(3,4) ]
gap> Display(Elements(CClasses[1][1]));
[ () ]
gap> Display(Elements(CClasses[2][1]));
[ (), (2,3)(4,5) ]
gap> Size(Union(Elements(CClasses[2])));
16
gap> Size(Union(Elements(CClasses[3])));
21
gap> Display(Elements(CClasses[3][1]));
[ (), (3,4,5), (3,5,4) ]
gap> Display(Elements(CClasses[2]));
[ Group( [ (2,3)(4,5) ] ), Group( [ (2,4)(3,5) ] ), Group( [ (2,5)(3,4) ] ), Group( [ (1,2)(4,5) ] ), Group( [ (1,2)(3,4) ] ), 
  Group( [ (1,2)(3,5) ] ), Group( [ (1,3)(4,5) ] ), Group( [ (1,3)(2,4) ] ), Group( [ (1,3)(2,5) ] ), Group( [ (1,4)(3,5) ] ), 
  Group( [ (1,4)(2,3) ] ), Group( [ (1,4)(2,5) ] ), Group( [ (1,5)(3,4) ] ), Group( [ (1,5)(2,3) ] ), Group( [ (1,5)(2,4) ] ) ]
gap> Display(Elements(CClasses[2][1]));
[ (), (2,3)(4,5) ]
gap> Display(Elements(CClasses[2][2]));
[ (), (2,4)(3,5) ]
gap> Display(Elements(CClasses[2][3]));
[ (), (2,5)(3,4) ]
gap> Display(Elements(CClasses[3][3]));
[ (), (2,3,5), (2,5,3) ]
gap> Display(Elements(CClasses[5][1]));
[ (), (1,2,3,4,5), (1,3,5,2,4), (1,4,2,5,3), (1,5,4,3,2) ]
gap> Size(Union(Elements(CClasses[5])));
25
gap> Display(Elements(CClasses[6][1]));
[ (), (3,4,5), (3,5,4), (1,2)(4,5), (1,2)(3,4), (1,2)(3,5) ]
gap> Size(Union(Elements(CClasses[6])));
36
gap> Display(Elements(CClasses[7][1]));
[ (), (2,5)(3,4), (1,2)(3,5), (1,2,3,4,5), (1,3)(4,5), (1,3,5,2,4), (1,4)(2,3), (1,4,2,5,3), (1,5,4,3,2), (1,5)(2,4) ]
gap> Size(Display(Elements(CClasses[7][1])));
[ (), (2,5)(3,4), (1,2)(3,5), (1,2,3,4,5), (1,3)(4,5), (1,3,5,2,4), (1,4)(2,3), (1,4,2,5,3), (1,5,4,3,2), (1,5)(2,4) ]
Function call: <func> must return a value
gap> Order(Display(Elements(CClasses[7][1])));
[ (), (2,5)(3,4), (1,2)(3,5), (1,2,3,4,5), (1,3)(4,5), (1,3,5,2,4), (1,4)(2,3), (1,4,2,5,3), (1,5,4,3,2), (1,5)(2,4) ]
Function call: <func> must return a value
gap> Order(Elements(CClasses[7][1]));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `Order' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Size(Elements(CClasses[7][1]));
10
gap> Size(Union(Elements(CClasses[7])));
40
gap> Display(Elements(CClasses[8][1]));
[ (), (3,4,5), (3,5,4), (2,3)(4,5), (2,3,4), (2,3,5), (2,4,3), (2,4,5), (2,4)(3,5), (2,5,3), (2,5,4), (2,5)(3,4) ]
gap> Size(Elements(CClasses[8][1]));
12
gap> Size(Union(Elements(CClasses[8])));
36
gap> ConjugacyClasses(A5);
[ ()^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4,5)^G, (1,2,3,5,4)^G ]
gap> List(ConjugacyClasses(A5),Size);
[ 1, 15, 20, 12, 12 ]
gap> help ConjugacyClasses
Variable: 'help' must have a value

Syntax error: ; expected
help ConjugacyClasses
                    ^
gap> NrConjugacyClasses(A5);
5
gap> ConjugacyClasses(A5);
[ ()^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4,5)^G, (1,2,3,5,4)^G ]
gap> ConjugacyClassesSubgroups(A5);
[ Group( () )^G, Group( [ (2,3)(4,5) ] )^G, Group( [ (3,4,5) ] )^G, Group( [ (2,3)(4,5), (2,4)(3,5) ] )^G, Group( [ (1,2,3,4,5) ] )^G, 
  Group( [ (3,4,5), (1,2)(4,5) ] )^G, Group( [ (1,2,3,4,5), (2,5)(3,4) ] )^G, Group( [ (2,3)(4,5), (2,4)(3,5), (3,4,5) ] )^G, 
  AlternatingGroup( [ 1 .. 5 ] )^G ]
gap> LogTo();
