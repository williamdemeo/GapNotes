gap> s4 := SymmetricGroup(4);
Sym( [ 1 .. 4 ] )
gap> GraphicSubgroupLattice(s4);
<graphic subgroup lattice "GraphicSubgroupLattice">
gap> MenuSelected( 0, 2, 1 );
#I  All Subgroups (G) --> (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24\
,25,26,27,28,29,G)
gap> PointerButtonDown(0,398,115,1);
gap> PointerButtonDown(0,481,409,1);
gap> PointerButtonDown(0,602,335,1);
gap> PointerButtonDown(0,400,338,1);
gap> PointerButtonDown(0,496,336,1);
gap> PointerButtonDown(0,396,260,1);
gap> PointerButtonDown(0,429,332,1);
gap> PointerButtonDown(0,244,342,1);
gap> PointerButtonDown(0,265,340,1);
gap> PointerButtonDown(0,195,488,1);
gap> PointerButtonDown(0,437,326,1);
gap> PointerButtonDown(0,316,333,1);
gap> PointerButtonDown(0,339,332,1);
gap> PointerButtonDown(0,462,325,1);
gap> PointerButtonDown(0,526,332,1);
gap> PointerButtonDown(0,457,487,1);
gap> MenuSelected( 0, 0, 1 );
gap> ConjugacyClasses(s4);
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
gap> ccls := ConjugacyClasses(s4);
[ ()^G, (1,2)^G, (1,2)(3,4)^G, (1,2,3)^G, (1,2,3,4)^G ]
gap> ccls(1)
> ;
<func> must be a function (not a list (plain,hom,imm))
gap> ccls[1];
()^G
gap> ccls[2];
(1,2)^G
gap> Elements(ccls[2]);
[ (3,4), (2,3), (2,4), (1,2), (1,3), (1,4) ]
gap> Elements(ccls[3]);
[ (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ]
gap> Elements(ccls[4]);
[ (2,3,4), (2,4,3), (1,2,3), (1,2,4), (1,3,2), (1,3,4), (1,4,2), (1,4,3) ]
gap> Elements(ccls[5]);
[ (1,2,3,4), (1,2,4,3), (1,3,4,2), (1,3,2,4), (1,4,3,2), (1,4,2,3) ]
gap> Subgroups(s4);
Variable: 'Subgroups' must have a value

gap> ConjugacyClassesSubgroups(s4);
[ Group( () )^G, Group( [ (1,3)(2,4) ] )^G, Group( [ (3,4) ] )^G, Group( [ (2,4,3) ] )^G,
  Group( [ (1,4)(2,3), (1,3)(2,4) ] )^G, Group( [ (1,2)(3,4), (3,4) ] )^G, 
  Group( [ (1,2)(3,4), (1,3,2,4) ] )^G, Group( [ (3,4), (2,4,3) ] )^G, 
  Group( [ (1,3)(2,4), (1,4)(2,3), (1,2) ] )^G, 
  Group( [ (1,3)(2,4), (1,4)(2,3), (2,4,3) ] )^G, 
  Group( [ (1,3)(2,4), (1,4)(2,3), (2,4,3), (1,2) ] )^G ]
gap> cclss := ConjugacyClassesSubgroups(s4);
[ Group( () )^G, Group( [ (1,3)(2,4) ] )^G, Group( [ (3,4) ] )^G, Group( [ (2,4,3) ] )^G,
  Group( [ (1,4)(2,3), (1,3)(2,4) ] )^G, Group( [ (1,2)(3,4), (3,4) ] )^G, 
  Group( [ (1,2)(3,4), (1,3,2,4) ] )^G, Group( [ (3,4), (2,4,3) ] )^G, 
  Group( [ (1,3)(2,4), (1,4)(2,3), (1,2) ] )^G, 
  Group( [ (1,3)(2,4), (1,4)(2,3), (2,4,3) ] )^G, 
  Group( [ (1,3)(2,4), (1,4)(2,3), (2,4,3), (1,2) ] )^G ]
gap> cclss[5];
Group( [ (1,4)(2,3), (1,3)(2,4) ] )^G
gap> Order(cclss[5]);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `Order' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> Size(cclss[5
> ]);
1
gap> Order(Representative(cclss[5]));
4
gap> Order(Representative(cclss[6]));
4
gap> Order(Representative(cclss[7]));
4
gap> Order(Representative(cclss[9]));
8
gap> Order(Representative(cclss[10]));
12
gap> Representative(cclss[10]);
Group([ (1,3)(2,4), (1,4)(2,3), (2,4,3) ])
gap> a4:=Representative(cclss[10]);
Group([ (1,3)(2,4), (1,4)(2,3), (2,4,3) ])
gap> IsAlternatingGroup(a4);
true
gap> Order(Representative(cclss[11]));
24
gap> quit;
user interrupt
