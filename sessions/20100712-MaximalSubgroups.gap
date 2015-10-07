gap> a4 := AlternatingGroup(4);
Alt( [ 1 .. 4 ] )
gap> intA4 := IntermediateSubgroups(a4, Group(()));
rec( subgroups := [ Group([ (1,2)(3,4) ]), Group([ (1,3)(2,4) ]), Group([ (1,4)(2,3) ]), 
      Group([ (2,4,3) ]), Group([ (1,3,4) ]), Group([ (1,4,2) ]), Group([ (1,2,3) ]), 
      Group([ (1,3)(2,4), (1,2)(3,4) ]) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], [ 0, 6 ], [ 0, 7 ], 
      [ 1, 8 ], [ 2, 8 ], [ 3, 8 ], [ 4, 9 ], [ 5, 9 ], [ 6, 9 ], [ 7, 9 ], [ 8, 9 ] ] )
gap> IntermediateSubgroups(intA4.subgroups[8], Group(()));
rec( subgroups := [ Group([ (1,2)(3,4) ]), Group([ (1,3)(2,4) ]), Group([ (1,4)(2,3) ]) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 4 ], [ 2, 4 ], [ 3, 4 ] ] )
gap> Size(intA4.subgroups);
8
gap> intA4.inclusions;
[ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], [ 0, 6 ], [ 0, 7 ], [ 1, 8 ], 
  [ 2, 8 ], [ 3, 8 ], [ 4, 9 ], [ 5, 9 ], [ 6, 9 ], [ 7, 9 ], [ 8, 9 ] ]
gap> intA4.inclusions[1];
[ 0, 1 ]
gap> intA4.inclusions[1][2];
1
gap> List(intA4.inclusions, x -> intA4.inclusions[x][2]=9);
List Element: <position> must be a positive integer (not a list (plain,cyc)) at
return intA4.inclusions[x][2] = 9;
 called from
func( elm ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace <position> via 'return <position>;' to continue
brk> quit;
gap> intA4.inclusions[1][1];
0
gap> intA4.inclusions[2][1];
0
gap> intA4.inclusions[2][2];
2
gap> PositionFirstComponent(intA4.inclusions, 9);
16
gap> Size(intA4.inclusions);
15
gap> List(intA4.inclusions, x -> x[][2]=9);
Syntax error: expression expected
List(intA4.inclusions, x -> x[][2]=9);
                              ^
gap> List(intA4.inclusions, x -> x[i][2]=9);
Syntax error: warning: unbound global variable
List(intA4.inclusions, x -> x[i][2]=9);
                               ^
Variable: 'i' must have an assigned value at
return x[i][2] = 9;
 called from
func( elm ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> List(intA4.inclusions, x -> x[..][2]=9);
Syntax error: expression expected
List(intA4.inclusions, x -> x[..][2]=9);
                               ^
gap> List(intA4.inclusions, x -> x[2]=9);
[ false, false, false, false, false, false, false, false, false, false, true, true, true, 
  true, true ]
gap> g := Group((1,2,3,4), (1,2));
Group([ (1,2,3,4), (1,2) ])
gap> Order(g);
24
gap> IsNaturalSymmetricGroup(g);
true
gap> GraphicalSubgroupLattice(g);
Variable: 'GraphicalSubgroupLattice' must have a value

gap> GraphicSubgroupLattice(g);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 0, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2\
5,26,27,28,29,G)
gap> PointerButtonDown(0,402,118,1);
gap> PointerButtonDown(0,608,331,1);
gap> PointerButtonDown(0,193,336,1);
gap> PointerButtonDown(0,486,412,1);
gap> PointerButtonDown(0,486,253,1);
gap> PointerButtonDown(0,394,181,1);
gap> PointerButtonDown(0,303,347,1);
gap> PointerButtonDown(0,470,261,1);
gap> PointerButtonDown(0,402,337,1);
gap> PointerButtonDown(0,470,360,1);
gap> PointerButtonDown(0,232,164,1);
gap> PointerButtonDown(0,190,488,1);
gap> PointerButtonDown(0,138,337,1);
gap> PointerButtonDown(0,454,489,1);
gap> MenuSelected( 0, 0, 2 );
gap> LogTo();
