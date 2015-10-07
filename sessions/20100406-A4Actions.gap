gap> a4 := AlternatingGroup(4);
Alt( [ 1 .. 4 ] )
gap> g := a4.1;
(1,2,3)
gap> Subgroups := ConjugacyClassesSubgroups(a4);
[ Group( () )^G, Group( [ (1,2)(3,4) ] )^G, Group( [ (2,4,3) ] )^G, Group( [ (1,3)(2,4), (1,2)(3,4) ] )^G, 
  Group( [ (1,3)(2,4), (1,4)(2,3), (2,4,3) ] )^G ]
gap> Subgroups(a4);
<func> must be a function (not a list (plain,hom,imm))
gap> Elements(a4);
[ (), (2,3,4), (2,4,3), (1,2)(3,4), (1,2,3), (1,2,4), (1,3,2), (1,3,4), (1,3)(2,4), (1,4,2), (1,4,3), (1,4)(2,3) ]
gap> a4.1
> ;
(1,2,3)
gap> a4.0;
List Element: <position> must be a positive integer (not a integer) at
return g[n];
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace <position> via 'return <position>;' to continue
brk> a4.2;
(2,3,4)
brk> quit;
gap> PermList( [0, 1, 2, 3] );
fail
gap> PermList( [1, 2, 3] );
()
gap> PermList( [2, 1, 3] );
(1,2)
gap> a4
> ;
Alt( [ 1 .. 4 ] )
gap> Elements(a4);
[ (), (2,3,4), (2,4,3), (1,2)(3,4), (1,2,3), (1,2,4), (1,3,2), (1,3,4), (1,3)(2,4), (1,4,2), (1,4,3), (1,4)(2,3) ]
gap> a4.3;
Error, illegal access to record component `obj.3'
of the object <obj>. (Objects by default do not have record components.
The error might be a relic from translated GAP3 code.)       called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> a4.1;
(1,2,3)
brk> a4.2
> ;
(2,3,4)
brk> a4.3
> ;
Error, illegal access to record component `obj.3'
of the object <obj>. (Objects by default do not have record components.
The error might be a relic from translated GAP3 code.)       called from
Error( msg ); called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk_02> quit;
brk> quit;
gap> E := Elements(a4);
Variable: 'E' is read only
not in any function
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after making it writable to continue
brk> e4 := Elements(a4);
[ (), (2,3,4), (2,4,3), (1,2)(3,4), (1,2,3), (1,2,4), (1,3,2), (1,3,4), (1,3)(2,4), (1,4,2), (1,4,3), (1,4)(2,3) ]
brk> e4[1];
()
brk> e4[2];
(2,3,4)
brk> Subgroups(a4);
<func> must be a function (not a list (plain,hom,imm))
brk> quit;
gap> Subgroup(a4, e4[2]);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `IsEmpty' on 1 arguments called from
IsEmpty( gens ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit
> ;quit
gap> Subgroup(a4, [e4[2]]);
Group([ (2,3,4) ])
gap> e4[2];
(2,3,4)
gap> Subgroup(a4, [e4[4],e4[9],e4[12]]);
Group([ (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ])
gap> Subgroup(a4, [e4[4],e4[9]]);
Group([ (1,2)(3,4), (1,3)(2,4) ])
gap> NormalSubgroups(a4);
[ Group(()), Group([ (1,3)(2,4), (1,2)(3,4) ]), Alt( [ 1 .. 4 ] ) ]
gap> Size(Group([(1,3)*(2,4), (1,2)*(3,4)]));
4
gap> Size(Subgroup(a4, [e4[4],e4[9],e4[12]]));
4
gap> v4 := Subgroup(a4, [e4[4],e4[9],e4[12]]);
Group([ (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ])
gap> MultiplicationTable(a4);
[ [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 2, 3, 1, 6, 4, 5, 8, 9, 7, 12, 10, 11 ], [ 3, 1, 2, 5, 6, 4, 9, 7, 8, 11, 12, 10 ], 
  [ 4, 7, 10, 1, 8, 11, 2, 5, 12, 3, 6, 9 ], [ 5, 9, 11, 3, 7, 12, 1, 6, 10, 2, 4, 8 ], [ 6, 8, 12, 2, 9, 10, 3, 4, 11, 1, 5, 7 ], 
  [ 7, 10, 4, 11, 1, 8, 5, 12, 2, 9, 3, 6 ], [ 8, 12, 6, 10, 2, 9, 4, 11, 3, 7, 1, 5 ], [ 9, 11, 5, 12, 3, 7, 6, 10, 1, 8, 2, 4 ], 
  [ 10, 4, 7, 8, 11, 1, 12, 2, 5, 6, 9, 3 ], [ 11, 5, 9, 7, 12, 3, 10, 1, 6, 4, 8, 2 ], [ 12, 6, 8, 9, 10, 2, 11, 3, 4, 5, 7, 1 ] ]
gap> Display(MultiplicationTable(a4));
[ [   1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12 ],
  [   2,   3,   1,   6,   4,   5,   8,   9,   7,  12,  10,  11 ],
  [   3,   1,   2,   5,   6,   4,   9,   7,   8,  11,  12,  10 ],
  [   4,   7,  10,   1,   8,  11,   2,   5,  12,   3,   6,   9 ],
  [   5,   9,  11,   3,   7,  12,   1,   6,  10,   2,   4,   8 ],
  [   6,   8,  12,   2,   9,  10,   3,   4,  11,   1,   5,   7 ],
  [   7,  10,   4,  11,   1,   8,   5,  12,   2,   9,   3,   6 ],
  [   8,  12,   6,  10,   2,   9,   4,  11,   3,   7,   1,   5 ],
  [   9,  11,   5,  12,   3,   7,   6,  10,   1,   8,   2,   4 ],
  [  10,   4,   7,   8,  11,   1,  12,   2,   5,   6,   9,   3 ],
  [  11,   5,   9,   7,  12,   3,  10,   1,   6,   4,   8,   2 ],
  [  12,   6,   8,   9,  10,   2,  11,   3,   4,   5,   7,   1 ] ]
gap> IntermediateSubgroups(a4, v4);
rec( subgroups := [  ], inclusions := [ [ 0, 1 ] ] )
gap> IntermediateSubgroups([], v4);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `IntermediateSubgroups' on 2 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> IntermediateSubgroups(Group(()), v4);
Error, <N> must be a normal subgroup of <G> called from
NaturalHomomorphismByNormalSubgroup( G, N ) called from
Error( no_method_found ); called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk_02> quit;
brk> quit;
gap> quit;
