gap> G:=SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> H:=Subgroup(G,[(1,2)]);
Group([ (1,2) ])
gap> K:=Subgroup(G,[(1,2,3,4)]);
Group([ (1,2,3,4) ])
gap> L:=GraphicSubgroupLattice(G);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> InsertVertex(L,H);
[ <vertex of graphic graph, label: "2", Serial:33>, true ]
gap> InsertVertex(L,K);
[ <vertex of graphic graph, label: "3", Serial:34>, true ]
gap> PointerButtonDown(1,402,333,1);
gap> PointerButtonDown(1,395,343,1);
gap> PointerButtonDown(1,402,490,1);
gap> MenuSelected( 1, 2, 1 );
#I  All Subgroups (3) --> (1,4,3)
gap> PointerButtonDown(1,404,38,1);
gap> MenuSelected( 1, 2, 1 );
#I  All Subgroups (G) --> (1,4,5,6,7,8,9,10,11,2,12,13,14,15,16,17,18,19,20,3,21,22,23,24,25,26,27,28,2\
9,G)
gap> PointerButtonDown(1,400,192,1);
gap> PointerButtonDown(1,224,353,1);
gap> PointerButtonDown(1,515,342,1);
gap> PointerButtonDown(1,487,259,1);
gap> PointerButtonDown(1,634,261,1);
gap> PointerButtonDown(1,666,338,1);
gap> PointerButtonDown(1,485,409,1);
gap> PointerButtonDown(1,546,480,1);
gap> PointerButtonDown(1,402,40,1);
gap> PointerButtonDown(1,540,479,1);
gap> MenuSelected( 1, 2, 12 );
#I  Intermediate Subgroups (G,2) --> (17,25,23,26)
gap> PointerButtonDown(1,135,341,1);
gap> dom:=Concatenation(RightCosets(G,H), RightCosets(G,K));
[ RightCoset(Group( [ (1,2) ] ),()), RightCoset(Group( [ (1,2) ] ),(2,4)), 
  RightCoset(Group( [ (1,2) ] ),(1,2,4)), RightCoset(Group( [ (1,2) ] ),(1,3)), 
  RightCoset(Group( [ (1,2) ] ),(1,3)(2,4)), RightCoset(Group( [ (1,2) ] ),(1,2,4,3)), 
  RightCoset(Group( [ (1,2) ] ),(1,3,2)), RightCoset(Group( [ (1,2) ] ),(1,3,2,4)), 
  RightCoset(Group( [ (1,2) ] ),(2,4,3)), RightCoset(Group( [ (1,2) ] ),(1,3,4)), 
  RightCoset(Group( [ (1,2) ] ),(1,3,4,2)), RightCoset(Group( [ (1,2) ] ),(1,2)(3,4)), 
  RightCoset(Group( [ (1,2,3,4) ] ),()), RightCoset(Group( [ (1,2,3,4) ] ),(3,4)), 
  RightCoset(Group( [ (1,2,3,4) ] ),(2,3)), RightCoset(Group( [ (1,2,3,4) ] ),(2,3,4)), 
  RightCoset(Group( [ (1,2,3,4) ] ),(2,4,3)), RightCoset(Group( [ (1,2,3,4) ] ),(2,4)) ]
gap> act:=Action(G,dom,OnRight);
Group([ (1,10,5,9)(2,12,4,8)(3,11,6,7)(14,17,16,15), (2,3)(4,7)(5,8)(6,9)(10,11)(13,16)(14,18)(15,17) 
 ])
gap> Orbits(act,MovedPoints(act));
[ [ 1, 10, 5, 11, 9, 8, 6, 2, 7, 12, 3, 4 ], [ 13, 16, 15, 14, 17, 18 ] ]
gap> dom;
[ RightCoset(Group( [ (1,2) ] ),()), RightCoset(Group( [ (1,2) ] ),(2,4)), 
  RightCoset(Group( [ (1,2) ] ),(1,2,4)), RightCoset(Group( [ (1,2) ] ),(1,3)), 
  RightCoset(Group( [ (1,2) ] ),(1,3)(2,4)), RightCoset(Group( [ (1,2) ] ),(1,2,4,3)), 
  RightCoset(Group( [ (1,2) ] ),(1,3,2)), RightCoset(Group( [ (1,2) ] ),(1,3,2,4)), 
  RightCoset(Group( [ (1,2) ] ),(2,4,3)), RightCoset(Group( [ (1,2) ] ),(1,3,4)), 
  RightCoset(Group( [ (1,2) ] ),(1,3,4,2)), RightCoset(Group( [ (1,2) ] ),(1,2)(3,4)), 
  RightCoset(Group( [ (1,2,3,4) ] ),()), RightCoset(Group( [ (1,2,3,4) ] ),(3,4)), 
  RightCoset(Group( [ (1,2,3,4) ] ),(2,3)), RightCoset(Group( [ (1,2,3,4) ] ),(2,3,4)), 
  RightCoset(Group( [ (1,2,3,4) ] ),(2,4,3)), RightCoset(Group( [ (1,2,3,4) ] ),(2,4)) ]
gap> Orbig(G,dom[1],OnRight);
Variable: 'Orbig' must have a value

gap> Orbit(G,dom[1],OnRight);
[ RightCoset(Group( [ (1,2) ] ),()), RightCoset(Group( [ (1,2) ] ),(1,3)(2,4)), 
  RightCoset(Group( [ (1,2) ] ),(1,4)(2,3)), RightCoset(Group( [ (1,2) ] ),(1,2)(3,4)), 
  RightCoset(Group( [ (1,2) ] ),(2,4,3)), RightCoset(Group( [ (1,2) ] ),(1,2,3)), 
  RightCoset(Group( [ (1,2) ] ),(1,3,4)), RightCoset(Group( [ (1,2) ] ),(1,4,2)), 
  RightCoset(Group( [ (1,2) ] ),(2,3,4)), RightCoset(Group( [ (1,2) ] ),(1,4,3)), 
  RightCoset(Group( [ (1,2) ] ),(1,2,4)), RightCoset(Group( [ (1,2) ] ),(1,3,2)) ]
gap> dom[1]
> ;
RightCoset(Group( [ (1,2) ] ),())
gap> dom[12]
> dom[13]
Syntax error: ; expected
dom[13]
  ^
> dom[13];
Syntax error: ; expected
dom[13];
  ^
[ 13 ]
gap> dom[12];
RightCoset(Group( [ (1,2) ] ),(1,2)(3,4))
gap> dom;
[ RightCoset(Group( [ (1,2) ] ),()), RightCoset(Group( [ (1,2) ] ),(2,4)), 
  RightCoset(Group( [ (1,2) ] ),(1,2,4)), RightCoset(Group( [ (1,2) ] ),(1,3)), 
  RightCoset(Group( [ (1,2) ] ),(1,3)(2,4)), RightCoset(Group( [ (1,2) ] ),(1,2,4,3)), 
  RightCoset(Group( [ (1,2) ] ),(1,3,2)), RightCoset(Group( [ (1,2) ] ),(1,3,2,4)), 
  RightCoset(Group( [ (1,2) ] ),(2,4,3)), RightCoset(Group( [ (1,2) ] ),(1,3,4)), 
  RightCoset(Group( [ (1,2) ] ),(1,3,4,2)), RightCoset(Group( [ (1,2) ] ),(1,2)(3,4)), 
  RightCoset(Group( [ (1,2,3,4) ] ),()), RightCoset(Group( [ (1,2,3,4) ] ),(3,4)), 
  RightCoset(Group( [ (1,2,3,4) ] ),(2,3)), RightCoset(Group( [ (1,2,3,4) ] ),(2,3,4)), 
  RightCoset(Group( [ (1,2,3,4) ] ),(2,4,3)), RightCoset(Group( [ (1,2,3,4) ] ),(2,4)) ]
gap> Size(dom);
18
gap> dom[13];
RightCoset(Group( [ (1,2,3,4) ] ),())
gap> dom[12];
RightCoset(Group( [ (1,2) ] ),(1,2)(3,4))
gap> Index(G,H);
12
gap> Index(G,K);
6
gap> Orbit(G,dom[13],OnRight);
[ RightCoset(Group( [ (1,2,3,4) ] ),()), RightCoset(Group( [ (1,2,3,4) ] ),(1,4)(2,3)), 
  RightCoset(Group( [ (1,2,3,4) ] ),(2,4,3)), RightCoset(Group( [ (1,2,3,4) ] ),(1,3,4)), 
  RightCoset(Group( [ (1,2,3,4) ] ),(2,3,4)), RightCoset(Group( [ (1,2,3,4) ] ),(1,2,4)) ]
gap> Orbit(G,dom[13],act);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `POW' on 2 arguments called from
act( pt, v ) called from
DoPcgsOrbitOp( G, false, pt, U, V, act ) called from
orbish( G, pnt, gens, acts, act ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> act;
Group([ (1,10,5,9)(2,12,4,8)(3,11,6,7)(14,17,16,15), (2,3)(4,7)(5,8)(6,9)(10,11)(13,16)(14,18)(15,17) 
 ])
gap> Size(act);
24
gap> act[1];
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `ELM_LIST' on 2 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> StructureDescription(act);
"S4"
gap> IsTransitive(act);
false
gap> Orbits(act,MovedPoints(act));
[ [ 1, 10, 5, 11, 9, 8, 6, 2, 7, 12, 3, 4 ], [ 13, 16, 15, 14, 17, 18 ] ]
gap> GeneratorsOfGroup(act);
[ (1,10,5,9)(2,12,4,8)(3,11,6,7)(14,17,16,15), (2,3)(4,7)(5,8)(6,9)(10,11)(13,16)(14,18)(15,17) ]
gap> Index(G,H);
12
gap> Index(G,K);
6
gap> Orbits(act,MovedPoints(act));
[ [ 1, 10, 5, 11, 9, 8, 6, 2, 7, 12, 3, 4 ], [ 13, 16, 15, 14, 17, 18 ] ]
gap> Read("BlocksImprimitive.g");
Error, file "BlocksImprimitive.g" must exist and be readable called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Read("blocksimp.g");
gap> b:=BlocksImprimitive(act);
[ [ [ 1, 5, 8, 12, 15, 17 ], 
      Group([ (2,3)(4,7)(5,8)(6,9)(10,11)(13,16)(14,18)(15,17), (1,5)(2,4)(3,6)(7,11)(8,12)(9,10)(14,
            16)(15,17), (1,8)(2,9)(3,7)(4,10)(5,12)(6,11)(13,18)(15,17) ]), 3 ] ]
gap> orb:=List(Orbits(act,MovedPoints(act)),Set);
[ [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 13, 14, 15, 16, 17, 18 ] ]
gap> orb2:=Orbits(act,MovedPoints(act));
[ [ 1, 10, 5, 11, 9, 8, 6, 2, 7, 12, 3, 4 ], [ 13, 16, 15, 14, 17, 18 ] ]
gap> b:=AllBlocks(Action(G,orb[1]));
[  ]
gap> b:=AllBlocks(Action(act,orb[1]));
[ [ 1, 2, 3 ], [ 1, 4, 7 ], [ 1, 5, 8, 12 ], [ 1, 12 ] ]
gap> bb:=List(b,x->orb[1]{x});
[ [ 1, 2, 3 ], [ 1, 4, 7 ], [ 1, 5, 8, 12 ], [ 1, 12 ] ]
gap> bbb:=List(bb,x->[x, Stabilizer(act,x,Onsets),Length(orb[1])/Length(x)]);
Syntax error: warning: unbound global variable
bbb:=List(bb,x->[x, Stabilizer(act,x,Onsets),Length(orb[1])/Length(x)]);
                                           ^
Variable: 'Onsets' must have an assigned value at
return [ x, Stabilizer( act, x, Onsets ), Length( orb[1] ) / Length( x ) ];
 called from
func( elm ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> bbb:=List(bb,x->[x, Stabilizer(act,x,OnSets),Length(orb[1])/Length(x)]);
[ [ [ 1, 2, 3 ], 
      Group([ (2,3)(4,7)(5,8)(6,9)(10,11)(13,16)(14,18)(15,17), (1,2,3)(4,11,8)(5,10,7)(6,12,9)(13,15,
            14)(16,18,17) ]), 4 ], 
  [ [ 1, 4, 7 ], Group([ (2,3)(4,7)(5,8)(6,9)(10,11)(13,16)(14,18)(15,17), 
          (1,4,7)(2,6,8)(3,5,9)(10,11,12)(13,17,14)(15,16,18) ]), 4 ], 
  [ [ 1, 5, 8, 12 ], Group([ (2,3)(4,7)(5,8)(6,9)(10,11)(13,16)(14,18)(15,17), 
          (1,5)(2,4)(3,6)(7,11)(8,12)(9,10)(14,16)(15,17), (1,8)(2,9)(3,7)(4,10)(5,12)(6,11)(13,18)(15,
            17) ]), 3 ], 
  [ [ 1, 12 ], Group([ (2,3)(4,7)(5,8)(6,9)(10,11)(13,16)(14,18)(15,17), (1,12)(2,10)(3,11)(4,9)(5,
            8)(6,7)(13,18)(14,16) ]), 6 ] ]
gap> Length(orb);
2
gap> orb;
[ [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 13, 14, 15, 16, 17, 18 ] ]
gap> g:=SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> gg:=DirectProduct(g,g);
Group([ (1,2,3,4), (1,2), (5,6,7,8), (5,6) ])
gap> h:=Subgroup(g, [(1,2)]);
Group([ (1,2) ])
gap> k:=Subgroup(g, [(1,2,3,4)]);
Group([ (1,2,3,4) ])
gap> hk:=DirectProduct(h,k);
Group([ (1,2), (3,4,5,6) ])
gap> IsSubgroup(gg,hk);
false
gap> Order(hk);
8
gap> Order(gg);
576
gap> Order(h);
2
gap> Order(k);
4
gap> emb1:=Embedding(gg,1);; 
gap> emb2:=Embedding(gg,2);; 
gap> hgg:=List(GeneratorsOfGroup(h), i->Image(emb1,i));
[ (1,2) ]
gap> Order(hgg);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `Order' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> kgg:=List(GeneratorsOfGroup(k), i->Image(emb2,i));
[ (5,6,7,8) ]
gap> hgg:=List(GeneratorsOfGroup(h), i->Image(emb1,i));  hgg:=Group(hgg,());;
[ (1,2) ]
gap> Order(hgg);
2
gap> kgg:=List(GeneratorsOfGroup(k), i->Image(emb2,i));  kgg:=Group(kgg,());;
[ (5,6,7,8) ]
gap> IsSubgroup(gg,hgg);
true
gap> IsSubgroup(gg,kgg);
true
gap> hk:=DirectProduct(hgg,kgg);
Group([ (1,2), (3,4,5,6) ])
gap> Order(hk);
8
gap> IsSubgroup(gg,hk);
false
gap> hgg:=List(GeneratorsOfGroup(h), i->Image(emb1,i)); 
[ (1,2) ]
gap> kgg:=List(GeneratorsOfGroup(k), i->Image(emb2,i)); 
[ (5,6,7,8) ]
gap> hk:=Group(hgg,kgg,());;
Error, usage: Group(<gen>,...), Group(<gens>), Group(<gens>,<id>) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> hk:=Group(Concatenation(hgg,kgg),());;
gap> # kgg:=Group(kgg,());;
gap> IsSubgroup(gg,hk);
true
gap> Order(hk);
8
gap> L:=GraphicSubgroupLattice(gg);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> InsertVertex(L,hk);
[ <vertex of graphic graph, label: "2", Serial:63>, true ]
gap> Index(gg,hk);
72
gap> intsubs:=IntermediateSubgroups(gg,hk);
rec( subgroups := [ Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4)(6,8) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8) ]), Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4) 
         ]), Group([ (5,6,7,8), (5,7)(6,8), (1,2), (2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,3) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4), (1,3)(2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (1,2)(3,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4), (1,3)(2,4)(6,8) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (1,3) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (1,2)(3,4), (1,3)(2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (2,4), (1,2)(3,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8), (1,2)(3,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8), (1,3) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8), (2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8), (1,2)(3,4), (1,3)(2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (2,4), (1,2)(3,4) ]) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], [ 1, 7 ], [ 2, 7 ], [ 2, 9 ], 
      [ 2, 10 ], [ 2, 11 ], [ 3, 6 ], [ 3, 7 ], [ 3, 8 ], [ 4, 9 ], [ 4, 13 ], [ 5, 11 ], [ 5, 13 ], 
      [ 6, 12 ], [ 6, 13 ], [ 7, 12 ], [ 7, 14 ], [ 8, 12 ], [ 9, 16 ], [ 9, 18 ], [ 10, 14 ], 
      [ 10, 15 ], [ 10, 16 ], [ 11, 15 ], [ 11, 18 ], [ 12, 17 ], [ 12, 18 ], [ 13, 18 ], [ 14, 17 ], 
      [ 15, 19 ], [ 16, 19 ], [ 17, 19 ], [ 18, 19 ] ] )
gap> numints:=Size(intsubs);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `Size' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> numints:=Size(intsubs.subgroups);
18
gap> for j in [1..Size(intsubs.subgroups)] do
>     InsertVertex(L,intsubs.subgroups[j]);
> od;
gap> PointerButtonDown(2,400,440,1);
gap> PointerButtonDown(2,193,71,1);
gap> PointerButtonDown(2,189,266,1);
gap> PointerButtonDown(2,615,347,1);
gap> PointerButtonDown(2,606,263,1);
gap> PointerButtonDown(2,431,298,1);
gap> PointerButtonDown(2,394,121,1);
gap> PointerButtonDown(2,536,264,1);
gap> PointerButtonDown(2,395,71,1);
gap> PointerButtonDown(2,686,73,1);
gap> PointerButtonDown(2,422,209,1);
gap> PointerButtonDown(2,301,347,1);
gap> PointerButtonDown(2,223,265,1);
gap> PointerButtonDown(2,172,267,1);
gap> PointerButtonDown(2,409,574,1);
gap> PointerButtonDown(2,787,76,1);
gap> Order(gg);
576
gap> Order(gg)/48;
12
gap> PointerButtonDown(2,569,216,1);
gap> PointerButtonDown(2,757,126,1);
gap> Order(gg)/(Order(k)*Order(g);
Syntax error: ) expected
Order(gg)/(Order(k)*Order(g);
                            ^
gap> Order(gg)/(Order(k)*Order(g));
6
gap> Order(gg)/(Order(h)*Order(g));
12
gap> PointerButtonDown(2,180,127,1);
gap> PointerButtonDown(2,216,70,1);
gap> PointerButtonDown(2,185,210,1);
gap> PointerButtonDown(2,183,352,1);
gap> PointerButtonDown(2,650,208,1);
gap> PointerButtonDown(2,772,212,1);
gap> L:=GraphicSubgroupLattice(gg);
Error, window system: Illegal Answer called from
WcOpenWindow( title, width, height ) called from
GraphicSheet( name, width, height ) called from
GraphicPoset( defaults.title, defaults.width, defaults.height ) called from
GraphicSubgroupLattice( G, rec(
     ) ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> a6+I0+I3+
Syntax error: warning: unbound global variable in *errin* line 1
a6+I0+I3+
  ^
Variable: 'a6' must have a value

Syntax error: warning: unbound global variable in *errin* line 1
a6+I0+I3+
     ^
Syntax error: warning: unbound global variable in *errin* line 1
a6+I0+I3+
        ^
> InsertVertex(L,hk);
brk> 
brk> quit;
gap> 
gap> 
gap> PointerButtonDown(3,442,300,1);
List Element: <list>[4] must have an assigned value at
win := WINDOWS[wid + 1];
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> L:=GraphicSubgroupLattice(gg);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> InsertVertex(L,hk);
[ <vertex of graphic graph, label: "2", Serial:84>, true ]
gap> hgg:=Group(hgg,());;
gap> kgg:=Group(kgg,());;
gap> InsertVertex(L,hgg);
[ <vertex of graphic graph, label: "3", Serial:85>, true ]
gap> PointerButtonDown(4,402,426,1);
gap> PointerButtonDown(4,402,542,1);
gap> MenuSelected( 4, 1, 4 );
gap> g1:=List(GeneratorsOfGroup(g), i->Image(emb1,i)); 
[ (1,2,3,4), (1,2) ]
gap> g2:=List(GeneratorsOfGroup(g), i->Image(emb2,i)); 
[ (5,6,7,8), (5,6) ]
gap> hgg:=List(GeneratorsOfGroup(h), i->Image(emb1,i)); 
[ (1,2) ]
gap> hgg:=List(GeneratorsOfGroup(h), i->Image(emb1,i)); 
[ (1,2) ]
gap> hk:=Group(Concatenation(hgg,kgg),());;
AppendList: <list2> must be a small list (not a object (component)) at
Append( res, arg[i] );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace <list2> via 'return <list2>;' to continue
brk> quit;
gap> hgg:=List(GeneratorsOfGroup(h), i->Image(emb1,i)); 
[ (1,2) ]
gap> kgg:=List(GeneratorsOfGroup(k), i->Image(emb2,i)); 
[ (5,6,7,8) ]
gap> hk:=Group(Concatenation(hgg,kgg),());;
gap> hg2:=Group(Concatenation(hgg,g2),());;
gap> g1k:=Group(Concatenation(g1,kgg),());;
gap> InsertVertex(L,hg2);
[ <vertex of graphic graph, label: "4", Serial:86>, true ]
gap> InsertVertex(L,g1k);
[ <vertex of graphic graph, label: "5", Serial:87>, true ]
gap> PointerButtonDown(4,454,361,1);
gap> PointerButtonDown(4,404,126,1);
gap> PointerButtonDown(4,395,214,1);
gap> PointerButtonDown(4,154,212,1);
gap> MenuSelected( 4, 1, 12 );
gap> PointerButtonDown(4,155,206,1);
gap> PointerButtonDown(4,155,206,1);
gap> PointerButtonDown(4,656,124,1);
gap> PointerButtonDown(4,54,125,1);
gap> PointerButtonDown(4,57,128,2);
gap> ButtonSelected(0,2);
true
gap> MenuSelected( 4, 1, 12 );
gap> PointerButtonDown(4,690,212,1);
gap> MenuSelected( 4, 1, 12 );
gap> 
gap> for j in [1..Size(intsubs.subgroups)] do
>     InsertVertex(L,intsubs.subgroups[j]);
> od;
gap> PointerButtonDown(4,194,351,1);
gap> PointerButtonDown(4,605,353,1);
gap> PointerButtonDown(4,403,266,1);
gap> PointerButtonDown(4,248,359,1);
gap> PointerButtonDown(4,401,297,1);
gap> PointerButtonDown(4,195,269,1);
gap> PointerButtonDown(4,392,183,1);
gap> PointerButtonDown(4,370,208,1);
gap> PointerButtonDown(4,608,272,1);
gap> PointerButtonDown(4,391,69,1);
gap> PointerButtonDown(4,424,95,1);
gap> PointerButtonDown(4,440,122,1);
gap> PointerButtonDown(4,394,126,1);
gap> PointerButtonDown(4,310,63,1);
gap> PointerButtonDown(4,521,98,1);
gap> PointerButtonDown(4,365,269,1);
gap> PointerButtonDown(4,599,133,1);
gap> PointerButtonDown(4,517,71,1);
gap> PointerButtonDown(4,471,65,1);
gap> PointerButtonDown(4,555,132,1);
gap> PointerButtonDown(4,342,267,1);
gap> PointerButtonDown(4,157,350,1);
gap> PointerButtonDown(4,408,436,1);
gap> PointerButtonDown(4,569,349,1);
gap> PointerButtonDown(4,398,350,1);
gap> intsubs;
rec( subgroups := [ Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4)(6,8) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8) ]), Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4) 
         ]), Group([ (5,6,7,8), (5,7)(6,8), (1,2), (2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,3) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4), (1,3)(2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (1,2)(3,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4), (1,3)(2,4)(6,8) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (1,3) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (1,2)(3,4), (1,3)(2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (2,4), (1,2)(3,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8), (1,2)(3,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8), (1,3) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8), (2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8), (1,2)(3,4), (1,3)(2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (2,4), (1,2)(3,4) ]) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], [ 1, 7 ], [ 2, 7 ], [ 2, 9 ], 
      [ 2, 10 ], [ 2, 11 ], [ 3, 6 ], [ 3, 7 ], [ 3, 8 ], [ 4, 9 ], [ 4, 13 ], [ 5, 11 ], [ 5, 13 ], 
      [ 6, 12 ], [ 6, 13 ], [ 7, 12 ], [ 7, 14 ], [ 8, 12 ], [ 9, 16 ], [ 9, 18 ], [ 10, 14 ], 
      [ 10, 15 ], [ 10, 16 ], [ 11, 15 ], [ 11, 18 ], [ 12, 17 ], [ 12, 18 ], [ 13, 18 ], [ 14, 17 ], 
      [ 15, 19 ], [ 16, 19 ], [ 17, 19 ], [ 18, 19 ] ] )
gap> Size(intsubs.subgroups);
18
gap> InsertVertex(L,intsubs.subgroups[1]);
[ <vertex of graphic graph, label: "6", Serial:88>, false ]
gap> InsertVertex(L,intsubs.subgroups[2]);
[ <vertex of graphic graph, label: "7", Serial:89>, false ]
gap> PointerButtonDown(4,489,364,1);
gap> PointerButtonDown(4,346,352,1);
gap> MenuSelected( 4, 1, 4 );
gap> InsertVertex(L,intsubs.subgroups[1]);
[ <vertex of graphic graph, label: "22", Serial:104>, true ]
gap> intsubs.subgroups[1];
Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4)(6,8) ])
gap> StructureDescription(intsubs.subgroups[1]);
"C2 x D8"
gap> InsertVertex(L,intsubs.subgroups[2]);
[ <vertex of graphic graph, label: "7", Serial:89>, false ]
gap> StructureDescription(intsubs.subgroups[2]);
"C2 x D8"
gap> StructureDescription(intsubs.subgroups[3]);
"C4 x C2 x C2"
gap> InsertVertex(L,intsubs.subgroups[3]);
[ <vertex of graphic graph, label: "8", Serial:90>, false ]
gap> StructureDescription(h);
"C2"
gap> StructureDescription(k);
"C4"
gap> l:=GraphicSubgroupLattice(g);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> InsertVertex(l,h);
[ <vertex of graphic graph, label: "2", Serial:107>, true ]
gap> PointerButtonDown(5,401,492,1);
gap> MenuSelected( 5, 1, 12 );
gap> InsertVertex(l,k);
[ <vertex of graphic graph, label: "3", Serial:108>, true ]
gap> PointerButtonDown(5,399,338,1);
gap> MenuSelected( 5, 1, 12 );
gap> PointerButtonDown(5,412,335,1);
gap> PointerButtonDown(5,397,484,1);
gap> MenuSelected( 5, 2, 1 );
#I  All Subgroups (K) --> (1,4,K)
gap> PointerButtonDown(5,403,38,1);
gap> MenuSelected( 5, 2, 1 );
#I  All Subgroups (G) --> (1,4,5,6,7,8,9,10,11,H,12,13,14,15,16,17,18,19,20,K,21,22,23,24,25,26,27,28,2\
9,G)
gap> PointerButtonDown(5,403,258,1);
gap> PointerButtonDown(5,460,185,1);
gap> PointerButtonDown(5,308,337,1);
gap> PointerButtonDown(5,461,337,1);
gap> PointerButtonDown(5,177,467,1);
gap> PointerButtonDown(5,401,414,1);
gap> PointerButtonDown(5,425,312,1);
gap> PointerButtonDown(5,351,422,1);
gap> PointerButtonDown(5,352,326,1);
gap> PointerButtonDown(5,427,328,1);
gap> PointerButtonDown(5,304,436,1);
gap> PointerButtonDown(5,392,327,1);
gap> PointerButtonDown(5,623,360,1);
gap> PointerButtonDown(5,396,113,1);
gap> PointerButtonDown(5,372,415,1);
gap> PointerButtonDown(5,236,472,1);
gap> PointerButtonDown(5,566,484,1);
gap> PointerButtonDown(5,562,484,1);
gap> PointerButtonDown(5,92,464,1);
gap> PointerButtonDown(5,398,31,1);
gap> MenuSelected( 5, 2, 12 );
#I  Intermediate Subgroups (G,H) --> (17,25,23,26)
gap> GeneratorsOfGroup(g);
[ (1,2,3,4), (1,2) ]
gap> newg:=Group([(1,2,3,4), (1,2)]);
Group([ (1,2,3,4), (1,2) ])
gap> newg=g;
true
gap> RightCosets(g,h);
[ RightCoset(Group( [ (1,2) ] ),()), RightCoset(Group( [ (1,2) ] ),(2,4)), 
  RightCoset(Group( [ (1,2) ] ),(1,2,4)), RightCoset(Group( [ (1,2) ] ),(1,3)), 
  RightCoset(Group( [ (1,2) ] ),(1,3)(2,4)), RightCoset(Group( [ (1,2) ] ),(1,2,4,3)), 
  RightCoset(Group( [ (1,2) ] ),(1,3,2)), RightCoset(Group( [ (1,2) ] ),(1,3,2,4)), 
  RightCoset(Group( [ (1,2) ] ),(2,4,3)), RightCoset(Group( [ (1,2) ] ),(1,3,4)), 
  RightCoset(Group( [ (1,2) ] ),(1,3,4,2)), RightCoset(Group( [ (1,2) ] ),(1,2)(3,4)) ]
gap> Size(RightCosets(g,h));
12
gap> Size(RightCosets(g,k));
6
gap> RightCosets(g,k);
[ RightCoset(Group( [ (1,2,3,4) ] ),()), RightCoset(Group( [ (1,2,3,4) ] ),(3,4)), 
  RightCoset(Group( [ (1,2,3,4) ] ),(2,3)), RightCoset(Group( [ (1,2,3,4) ] ),(2,3,4)), 
  RightCoset(Group( [ (1,2,3,4) ] ),(2,4,3)), RightCoset(Group( [ (1,2,3,4) ] ),(2,4)) ]
gap> MenuSelected( 5, 0, 1 );
gap> InsertVertex(L,intsubs.subgroups[1]);
[ <vertex of graphic graph, label: "22", Serial:104>, false ]
gap> G := Group([(1,2,3,4),(1,2)]);;  # S_4
gap> H := Subgroup(G, [(1,2)]);       # a subgroup of index 12
Group([ (1,2) ])
gap> K := Subgroup(G, [(1,2,3,4)]);   # a subgroup of index 6
Group([ (1,2,3,4) ])
gap> G1xG2 := DirectProduct(G, G);
Group([ (1,2,3,4), (1,2), (5,6,7,8), (5,6) ])
gap> emb1 := Embedding(G1xG2, 1);; 
gap> emb2 := Embedding(G1xG2, 2);
2nd embedding into Group([ (1,2,3,4), (1,2), (5,6,7,8), (5,6) ])
gap> Order(G1xG2);
576
gap> G1 := List(GeneratorsOfGroup(G), i->Image(emb1,i)); 
[ (1,2,3,4), (1,2) ]
gap> G2 := List(GeneratorsOfGroup(G), i->Image(emb2,i)); 
[ (5,6,7,8), (5,6) ]
gap> h1 := List(GeneratorsOfGroup(H), i->Image(emb1,i)); 
[ (1,2) ]
gap> k2 := List(GeneratorsOfGroup(K), i->Image(emb2,i)); 
[ (5,6,7,8) ]
gap> HxK := Group(Concatenation(h1,k2),());;
gap> HxG2 := Group(Concatenation(h1,G2),());;
gap> G1xK := Group(Concatenation(G1,k2),());;
gap> L:=GraphicSubgroupLattice(G1xG2);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> InsertVertex(L,HxK);
[ <vertex of graphic graph, label: "2", Serial:137>, true ]
gap> PointerButtonDown(6,396,432,1);
gap> MenuSelected( 6, 1, 12 );
gap> InsertVertex(L,HxG2);
[ <vertex of graphic graph, label: "3", Serial:138>, true ]
gap> PointerButtonDown(6,395,208,1);
gap> MenuSelected( 6, 1, 12 );
gap> InsertVertex(L,G1xK);
[ <vertex of graphic graph, label: "4", Serial:139>, true ]
gap> PointerButtonDown(6,393,124,1);
gap> MenuSelected( 6, 1, 12 );
gap> PointerButtonDown(6,404,128,1);
gap> PointerButtonDown(6,400,210,1);
gap> MenuSelected( 6, 1, 7 );
gap> PointerButtonDown(6,199,176,1);
gap> intsubs:=IntermediateSubgroups(G1xG2,HxK);
rec( subgroups := [ Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4)(6,8) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8) ]), Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4) 
         ]), Group([ (5,6,7,8), (5,7)(6,8), (1,2), (2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,3) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4), (1,3)(2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (1,2)(3,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4), (1,3)(2,4)(6,8) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (1,3) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (1,2)(3,4), (1,3)(2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (2,4), (1,2)(3,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8), (1,2)(3,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8), (1,3) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8), (2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8), (1,2)(3,4), (1,3)(2,4) ]), 
      Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (2,4), (1,2)(3,4) ]) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 0, 5 ], [ 1, 7 ], [ 2, 7 ], [ 2, 9 ], 
      [ 2, 10 ], [ 2, 11 ], [ 3, 6 ], [ 3, 7 ], [ 3, 8 ], [ 4, 9 ], [ 4, 13 ], [ 5, 11 ], [ 5, 13 ], 
      [ 6, 12 ], [ 6, 13 ], [ 7, 12 ], [ 7, 14 ], [ 8, 12 ], [ 9, 16 ], [ 9, 18 ], [ 10, 14 ], 
      [ 10, 15 ], [ 10, 16 ], [ 11, 15 ], [ 11, 18 ], [ 12, 17 ], [ 12, 18 ], [ 13, 18 ], [ 14, 17 ], 
      [ 15, 19 ], [ 16, 19 ], [ 17, 19 ], [ 18, 19 ] ] )
gap> for j in [1..Size(intsubs.subgroups)] do
>     InsertVertex(L,intsubs.subgroups[j]);
> od;
gap> PointerButtonDown(6,874,501,1);
gap> PointerButtonDown(6,567,260,1);
gap> PointerButtonDown(6,578,423,1);
gap> PointerButtonDown(6,62,423,1);
gap> PointerButtonDown(6,577,382,1);
gap> PointerButtonDown(6,286,499,1);
gap> PointerButtonDown(6,872,384,1);
gap> PointerButtonDown(6,191,414,1);
gap> PointerButtonDown(6,167,264,1);
gap> PointerButtonDown(6,279,370,1);
gap> PointerButtonDown(6,354,491,1);
gap> PointerButtonDown(6,443,491,1);
gap> PointerButtonDown(6,574,500,1);
gap> PointerButtonDown(6,269,427,1);
gap> PointerButtonDown(6,337,369,1);
gap> PointerButtonDown(6,218,260,1);
gap> PointerButtonDown(6,983,302,1);
gap> PointerButtonDown(6,606,139,1);
gap> PointerButtonDown(6,621,174,1);
gap> PointerButtonDown(6,377,370,1);
gap> PointerButtonDown(6,317,410,1);
gap> PointerButtonDown(6,355,422,1);
gap> PointerButtonDown(6,480,298,1);
gap> PointerButtonDown(6,325,372,1);
gap> PointerButtonDown(6,709,129,1);
gap> PointerButtonDown(6,602,175,1);
gap> PointerButtonDown(6,634,189,1);
gap> PointerButtonDown(6,706,130,1);
gap> PointerButtonDown(6,132,387,1);
gap> PointerButtonDown(6,242,259,1);
gap> PointerButtonDown(6,81,180,1);
gap> PointerButtonDown(6,578,621,1);
gap> PointerButtonDown(6,694,496,1);
gap> PointerButtonDown(6,664,184,1);
gap> PointerButtonDown(6,805,301,1);
gap> PointerButtonDown(6,727,305,1);
gap> PointerButtonDown(6,619,175,1);
gap> PointerButtonDown(6,653,134,1);
gap> PointerButtonDown(6,695,296,1);
gap> PointerButtonDown(6,273,266,1);
gap> PointerButtonDown(6,162,507,1);
gap> PointerButtonDown(6,475,506,1);
gap> PointerButtonDown(6,608,170,1);
gap> PointerButtonDown(6,593,504,1);
gap> PointerButtonDown(6,660,301,1);
gap> PointerButtonDown(6,648,134,1);
gap> PointerButtonDown(6,134,499,1);
gap> PointerButtonDown(6,44,387,1);
gap> PointerButtonDown(6,430,509,1);
gap> PointerButtonDown(6,174,390,1);
gap> PointerButtonDown(6,397,501,1);
gap> MenuSelected( 6, 1, 12 );
gap> PointerButtonDown(6,238,379,1);
gap> PointerButtonDown(6,452,625,1);
gap> PointerButtonDown(6,423,622,1);
gap> PointerButtonDown(6,32,180,1);
gap> PointerButtonDown(6,53,188,1);
gap> PointerButtonDown(6,406,505,1);
gap> PointerButtonDown(6,576,827,1);
gap> PointerButtonDown(6,378,817,1);
gap> PointerButtonDown(6,384,511,1);
gap> PointerButtonDown(6,237,382,1);
gap> MenuSelected( 6, 0, 1 );
gap> PointerButtonDown(6,372,821,1);
gap> MenuSelected( 6, 1, 4 );
gap> MenuSelected( 6, 0, 1 );
gap> PointerButtonDown(6,385,506,1);
gap> PointerButtonDown(6,236,376,1);
gap> MenuSelected( 6, 0, 1 );
gap> InsertVertex(L,intsubs.subgroups[1]);
[ <vertex of graphic graph, label: "5", Serial:140>, false ]
gap> intsubs.subgroups[1];
Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4)(6,8) ])
gap> Size(intsubs.subgroups[1]);
16
gap> StructureDescription(intsubs.subgroups[1]);
"C2 x D8"
gap> InsertVertex(L,intsubs.subgroups[2]);
[ <vertex of graphic graph, label: "6", Serial:141>, false ]
gap> Size(intsubs.subgroups[2]);
16
gap> StructureDescription(intsubs.subgroups[2]);
"C2 x D8"
gap> InsertVertex(L,intsubs.subgroups[3]);
[ <vertex of graphic graph, label: "7", Serial:142>, false ]
gap> Size(intsubs.subgroups[3]);
16
gap> StructureDescription(intsubs.subgroups[3]);
"C4 x C2 x C2"
gap> InsertVertex(L,intsubs.subgroups[4]);
[ <vertex of graphic graph, label: "8", Serial:143>, false ]
gap> Size(intsubs.subgroups[4]);
24
gap> StructureDescription(intsubs.subgroups[4]);
"C4 x S3"
gap> intsubs.subgroup[2];
Record: '<rec>.subgroup' must have an assigned value
not in any function
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after assigning a value to continue
brk> quit;
gap> intsubs.subgroups[2];
C2 x D8
gap> GeneratorsOfGroup(intsubs.subgroups[2]);
[ (5,6,7,8), (5,7)(6,8), (1,2), (6,8) ]
gap> GeneratorsOfGroup(intsubs.subgroups[3]);
[ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4) ]
gap> GeneratorsOfGroup(intsubs.subgroups[4]);
[ (5,6,7,8), (5,7)(6,8), (1,2), (2,4) ]
gap> InsertVertex(L,intsubs.subgroups[5]);
[ <vertex of graphic graph, label: "9", Serial:144>, false ]
gap> intsubs.subgroups[5];
Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,3) ])
gap> Size(intsubs.subgroups[5]);
24
gap> StructureDescription(intsubs.subgroups[5]);
"C4 x S3"
gap> InsertVertex(L,intsubs.subgroups[6]);
[ <vertex of graphic graph, label: "10", Serial:145>, false ]
gap> intsubs.subgroups[6];
Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4), (1,3)(2,4) ])
gap> Size(intsubs.subgroups[6]);
32
gap> StructureDescription(intsubs.subgroups[6]);
"C4 x D8"
gap> InsertVertex(L,intsubs.subgroups[7]);
[ <vertex of graphic graph, label: "11", Serial:146>, false ]
gap> intsubs.subgroups[7];
Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (1,2)(3,4) ])
gap> Size(intsubs.subgroups[7]);
32
gap> StructureDescription(intsubs.subgroups[7]);
"C2 x C2 x D8"
gap> InsertVertex(L,intsubs.subgroups[8]);
[ <vertex of graphic graph, label: "12", Serial:147>, false ]
gap> intsubs.subgroups[8];
Group([ (5,6,7,8), (5,7)(6,8), (1,2), (1,2)(3,4), (1,3)(2,4)(6,8) ])
gap> Size(intsubs.subgroups[8]);
32
gap> StructureDescription(intsubs.subgroups[8]);
"(C4 x C2 x C2) : C2"
gap> InsertVertex(L,intsubs.subgroups[9]);
[ <vertex of graphic graph, label: "13", Serial:148>, false ]
gap> intsubs.subgroups[9];
Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (2,4) ])
gap> Size(intsubs.subgroups[9]);
48
gap> StructureDescription(intsubs.subgroups[9]);
"D8 x S3"
gap> InsertVertex(L,intsubs.subgroups[10]);
[ <vertex of graphic graph, label: "HxG2", Serial:138>, false ]
gap> intsubs.subgroups[10];
Group([ (5,6,7,8), (5,7)(6,8), (1,2), (7,8) ])
gap> Size(intsubs.subgroups[10]);
48
gap> StructureDescription(intsubs.subgroups[10]);
"C2 x S4"
gap> InsertVertex(L,intsubs.subgroups[11]);
[ <vertex of graphic graph, label: "14", Serial:149>, false ]
gap> intsubs.subgroups[11];
Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (1,3) ])
gap> Size(intsubs.subgroups[11]);
48
gap> StructureDescription(intsubs.subgroups[11]);
"D8 x S3"
gap> InsertVertex(L,intsubs.subgroups[12]);
[ <vertex of graphic graph, label: "15", Serial:150>, false ]
gap> intsubs.subgroups[12];
Group([ (5,6,7,8), (5,7)(6,8), (1,2), (6,8), (1,2)(3,4), (1,3)(2,4) ])
gap> Size(intsubs.subgroups[12]);
64
gap> StructureDescription(intsubs.subgroups[12]);
"D8 x D8"
gap> MenuSelected( 6, 0, 2 );
gap> quit;
