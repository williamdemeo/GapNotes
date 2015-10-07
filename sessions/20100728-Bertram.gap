gap> unionMaxjs := [];
[  ]
gap> IsEmpty(unionMaxjs);
true
gap> Read("testConjecture.g");
Syntax error: warning: unbound global variable in testConjecture.g line 98
        unionNNMaxjs := []; # union of cc's intersecting all other (not i) non-normal \
max subgroup reps
                      ^
Syntax error: warning: unbound global variable in testConjecture.g line 105
                unionNNMaxjs := Union(unionNNMaxjs, intersectList[j]);
                              ^
Syntax error: warning: unbound global variable in testConjecture.g line 105
                unionNNMaxjs := Union(unionNNMaxjs, intersectList[j]);
                                                  ^
Syntax error: warning: unbound global variable in testConjecture.g line 115
        if IsSubset(unionNNMaxjs, intersectList[i]) then
                                ^
Syntax error: od expected in testConjecture.g line 121
end;;  ^
gap> Read("testConjecture.g");
Syntax error: od expected in testConjecture.g line 121
end;;  ^
gap> Read("testConjecture.g");
gap> s4 := SymmetricGroup(4);;
gap> S4 := SymmetricGroup(4);;
gap> name := "S4";
"S4"
gap> testConjecture(S4, s4, name, true);
Variable: 'intersectList' must have an assigned value at
intersectList[i] := Concatenation( intersectList[i], ccRenamed[j] );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> Read("testConjecture.g");
brk> quit;
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
AppendList: <list2> must be a small list (not a object (component)) at
Append( res, arg[i] );
 called from
Concatenation( intersectList[i], ccRenamed[j] ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace <list2> via 'return <list2>;' to continue
brk> quit;
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
List Element: <list>[1] must have an assigned value at
intersectList[i] := Concatenation( intersectList[i], ccRenamed[j] );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
List Element: <list>[1] must have an assigned value at
intersectList[i] := Concatenation( intersectList[i], ccRenamed[j] );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
AppendList: <list2> must be a small list (not a object (component)) at
Append( res, arg[i] );
 called from
Concatenation( intersectList[i], ccRenamed[j] ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace <list2> via 'return <list2>;' to continue
brk> quit;
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
List Element: <list>[2] must have an assigned value at
intersectList[i] := Concatenation( intersectList[i], Elements( cc[j] ) );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> cc := ConjugacyClasses(s4);
[ a, b, c, d, e ]
gap> CC := ConjugacyClasses(S4);
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
gap> Elements(cc[1]);
[ () ]
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
[ () ]
[ (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ]
[ (2,3,4), (2,4,3), (1,2,3), (1,2,4), (1,3,2), (1,3,4), (1,4,2), (1,4,3) ]
[ () ]
List Element: <list>[2] must have an assigned value at
intersectList[i] := Concatenation( intersectList[i], Elements( cc[j] ) );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
[ () ]
[ (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ]
[ (2,3,4), (2,4,3), (1,2,3), (1,2,4), (1,3,2), (1,3,4), (1,4,2), (1,4,3) ]
[ () ]
List Element: <list>[2] must have an assigned value at
intersectList[i] := Concatenation( intersectList[i], Elements( cc[j] ) );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
[ () ]
AppendList: <list2> must be a small list (not a object (component)) at
Append( res, arg[i] );
 called from
Concatenation( intersectList[i], ccRenamed[j] ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace <list2> via 'return <list2>;' to continue
brk> quit;
gap> testConjecture(S4, s4, name, true);
[ () ]
AppendList: <list2> must be a small list (not a object (component)) at
Append( res, arg[i] );
 called from
Concatenation( intersectList[i], ccRenamed[j] ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace <list2> via 'return <list2>;' to continue
brk> quit;
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
[ () ]
[ (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ]
[ (2,3,4), (2,4,3), (1,2,3), (1,2,4), (1,3,2), (1,3,4), (1,4,2), (1,4,3) ]
[ () ]
[ (3,4), (2,3), (2,4), (1,2), (1,3), (1,4) ]
[ (2,3,4), (2,4,3), (1,2,3), (1,2,4), (1,3,2), (1,3,4), (1,4,2), (1,4,3) ]
[ () ]
[ (3,4), (2,3), (2,4), (1,2), (1,3), (1,4) ]
[ (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ]
[ (1,2,3,4), (1,2,4,3), (1,3,4,2), (1,3,2,4), (1,4,3,2), (1,4,2,3) ]
<expr> must be 'true' or 'false' (not a list (range,ssort)) at
for j  in [ 1 .. nummscr ] and j <> i  do
    unionMaxjs := Union( unionMaxjs, intersectList[j] );
    if IsNormal( G, mscr[j] )  then
        ;
    else
        unionNNMaxjs := Union( unionNNMaxjs, intersectList[j] );
    fi;
od;
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
gap> testConjecture(S4, s4, name, false);
gap> Read("testConjecture.g");
gap> testConjecture(S4, s4, name, true);
gap> G := GL(2,3);;
gap> g := GL(2,3);;
gap> name := "GL23";
"GL23"
gap> testConjecture(G, g, name, true);
gap> NumberSmallGroups(48);
52
gap> SmallGroupsInformation(48);

  There are 52 groups of order 48.
  They are sorted by their Frattini factors. 
     1 has Frattini factor [ 6, 1 ].
     2 has Frattini factor [ 6, 2 ].
     3 has Frattini factor [ 12, 3 ].
     4 - 19 have Frattini factor [ 12, 4 ].
     20 - 27 have Frattini factor [ 12, 5 ].
     28 - 30 have Frattini factor [ 24, 12 ].
     31 - 33 have Frattini factor [ 24, 13 ].
     34 - 43 have Frattini factor [ 24, 14 ].
     44 - 47 have Frattini factor [ 24, 15 ].
     48 - 52 have trivial Frattini subgroup.

  For the selection functions the values of the following attributes 
  are precomputed and stored:
     IsAbelian, IsNilpotentGroup, IsSupersolvableGroup, IsSolvableGroup, 
     LGLength, FrattinifactorSize and FrattinifactorId. 

  This size belongs to layer 2 of the SmallGroups library. 
  IdSmallGroup is available for this size. 
 
gap> BO1 := SmallGroup(48,1);
<pc group of size 48 with 5 generators>
gap> BO1 := SmallGroup(48,2);
<pc group of size 48 with 5 generators>
gap> BO1 := SmallGroup(48,3);
<pc group of size 48 with 5 generators>
gap> BO1 := SmallGroup(48,4);
<pc group of size 48 with 5 generators>
gap> BO1 := SmallGroup(48,5);
<pc group of size 48 with 5 generators>
gap> BO1 := SmallGroup(48,6);
<pc group of size 48 with 5 generators>
gap> BO1 := SmallGroup(48,52);
<pc group of size 48 with 5 generators>
gap> BO1 := SmallGroup(48,47);
<pc group of size 48 with 5 generators>
gap> BO1 := SmallGroup(48,46);
<pc group of size 48 with 5 generators>
gap> BO1 := SmallGroup(48,1);
<pc group of size 48 with 5 generators>
gap> GeneratorsOfGroup(BO1);
[ f1, f2, f3, f4, f5 ]
gap> BO := SmallGroup(48,28);
<pc group of size 48 with 5 generators>
gap> bo := SmallGroup(48,28);
<pc group of size 48 with 5 generators>
gap> name="BO";
false
gap> name:="BO";
"BO"
gap> testConjecture(BO, bo, name, true);
gap> NumberSmallGroups(72);
50
gap> NrConjugacyClasses(s4);
5
gap> Read("findFrobeniusGroup.g");
Syntax error: expression expected in findFrobeniusGroup.g line 1
for i in [1,..,50] do
             ^
gap> Read("findFrobeniusGroup.g");

The Frobenius group of order 72 has GAP ID [72, 41]
gap> G := SmallGroup(72,41);;
gap> g := SmallGroup(72,41);
<pc group of size 72 with 5 generators>
gap> testConjecture(G, g, "Frobenius72", true);
gap> G:= GU(2,3);
GU(2,3)
gap> g:= GU(2,3);
GU(2,3)
gap> name:="GU23";
"GU23"
gap> testConjecture(G, g, name, true);
gap> quit;
