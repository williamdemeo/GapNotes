gap> G := SmallGroup(960,11357);
Group([ (1,4,2)(3,10,6)(5,13,9)(8,14,12)(11,16,15), (1,12,7,3)(2,8,4,5)(6,10,13,11)(9,16,15,14) ])
gap> ms := MaximalSubgroups(G);;
gap> msind=[1, 17, 48, 57, 65];
Variable: 'msind' must have a value

gap> msind:=[1, 17, 48, 57, 65];
[ 1, 17, 48, 57, 65 ]
gap> for k in msind do
> Core(G, ms(k));
> od;
Function Calls: <func> must be a function (not a list (plain,hom,imm)) at
Core( G, ms( k ) );
 called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can replace <func> via 'return <func>;' to continue
brk> quit;
gap> ms(1);
<func> must be a function (not a list (plain,hom,imm))
gap> for k in msind do
> Core(G, ms[k]);
> od;
gap> ms[1];
Group([ (1,2,12)(3,13,16)(4,11,6)(5,8,9)(7,14,10), (2,3)(4,6)(5,12)(7,11)(8,13)(15,16) ])
gap> Core(G, ms[1]);
Group(())
gap> Print(Core(G, ms[1]));
Group( () )gap> for k in msind do
> Print(Core(G, ms[k]), "\n");
> od;
Group( () )
Group( () )
Group( () )
Group( () )
Group( [ ( 1, 2)( 3, 9)( 4, 7)( 5,11)( 6,16)( 8,10)(12,15)(13,14), ( 1, 3)( 2, 9)( 4,15)( 5,16)( 6,11)( 7,12)( 8,14)(10,13), 
  ( 1, 4)( 2, 7)( 3,15)( 5,10)( 6,14)( 8,11)( 9,12)(13,16), ( 1, 5)( 2,11)( 3,16)( 4,10)( 6, 9)( 7, 8)(12,14)(13,15) ] )
gap> StructureDescription(ms[65]);
"((C2 x C2 x C2 x C2) : C3) : C2"
gap> StructureDescription(Core(G,ms[65]));
"C2 x C2 x C2 x C2"
gap> StructureDescription(G);
"(C2 x C2 x C2 x C2) : A5"
gap> H := Intersection(ms[1], ms[17]);
Group([ (2,3)(4,6)(5,12)(7,11)(8,13)(15,16), (1,2)(5,13)(6,10)(8,16)(11,14)(12,15) ])
gap> StructureDescription(H);
"S3"
gap> HELP("IsTrivial");
gap> PointerButtonDown(0,81,24,1);
gap> IsTrivial(Core(G,ms[1]));
true
gap> IsTrivial(Core(G,ms[65]));
false
gap> Read("findA4Upper.g");
Syntax error: warning: unbound global variable in findA4Upper.g line 94
                                                                coreflag := 0;
                                                                          ^
Syntax error: warning: unbound global variable in findA4Upper.g line 99
                                                                        coreflag := 1;
                                                                                  ^
Syntax error: warning: unbound global variable in findA4Upper.g line 105
                                                                if coreflag = 0 then
                                                                            ^
gap> Read("findA4Upper.g");
gap> findA4Upper(960,960);
Checking all 11394 groups of order |G| = 960...user interrupt at
bpt := S.orbit[1];
 called from
MembershipTestKnownBase( S, options.knownBase, [ rep, [ g ] ] ) called from
StabChainStrong( S.stabilizer, [ gen ], options ); called from
StabChainStrong( chain, [ g ], options ); called from
DoClosurePrmGp( G, gens, PG_EMPTY_OPT ) called from
ClosureGroup( U, rt{i} ) called from
...
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> quit;
