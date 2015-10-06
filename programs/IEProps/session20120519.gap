gap> Read("PermutingExampleSearch.g");
Checking the 2 group(s) of order 6
Checking the 1 group(s) of order 7
Checking the 5 group(s) of order 8
Checking the 2 group(s) of order 9
Checking the 2 group(s) of order 10
Checking the 1 group(s) of order 11
Checking the 5 group(s) of order 12
Checking the 1 group(s) of order 13
Checking the 2 group(s) of order 14
Checking the 1 group(s) of order 15
Checking the 14 group(s) of order 16
===============>  Candidate: SmallGroup(16, 3), H=cc[7], K=cc[10]    <=============== 
 ===============>  Candidate: SmallGroup(16, 3), H=cc[7], K=cc[12]    <=============== 
 ===============>  Candidate: SmallGroup(16, 3), H=cc[11], K=cc[12]    <=============== 
 ===============>  Candidate: SmallGroup(16, 11), H=cc[16], K=cc[18]    <=============== 
 ===============>  Candidate: SmallGroup(16, 11), H=cc[17], K=cc[19]    <=============== 
 Checking the 1 group(s) of order 17
Checking the 5 group(s) of order 18
===============>  Candidate: SmallGroup(18, 3), H=cc[5], K=cc[7]    <=============== 
 ===============>  Candidate: SmallGroup(18, 4), H=cc[7], K=cc[8]    <=============== 
 ===============>  Candidate: SmallGroup(18, 4), H=cc[7], K=cc[9]    <=============== 
 ===============>  Candidate: SmallGroup(18, 4), H=cc[7], K=cc[10]    <=============== 
 ===============>  Candidate: SmallGroup(18, 4), H=cc[8], K=cc[9]    <=============== 
 ===============>  Candidate: SmallGroup(18, 4), H=cc[8], K=cc[10]    <=============== 
 ===============>  Candidate: SmallGroup(18, 4), H=cc[9], K=cc[10]    <=============== 
 Checking the 1 group(s) of order 19
Checking the 5 group(s) of order 20
Checking the 2 group(s) of order 21
Checking the 2 group(s) of order 22
Checking the 1 group(s) of order 23
Checking the 15 group(s) of order 24
===============>  Candidate: SmallGroup(24, 6), H=cc[6], K=cc[10]    <=============== 
 ===============>  Candidate: SmallGroup(24, 6), H=cc[7], K=cc[11]    <=============== 
 ===============>  Candidate: SmallGroup(24, 6), H=cc[10], K=cc[12]    <=============== 
 ===============>  Candidate: SmallGroup(24, 6), H=cc[11], K=cc[12]    <=============== 
 ===============>  Candidate: SmallGroup(24, 8), H=cc[6], K=cc[11]    <=============== 
 ===============>  Candidate: SmallGroup(24, 8), H=cc[8], K=cc[10]    <=============== 
 ===============>  Candidate: SmallGroup(24, 8), H=cc[8], K=cc[11]    <=============== 
 ===============>  Candidate: SmallGroup(24, 8), H=cc[10], K=cc[12]    <=============== 
 ===============>  Candidate: SmallGroup(24, 8), H=cc[11], K=cc[12]    <=============== 
 ===============>  Candidate: SmallGroup(24, 12), H=cc[4], K=cc[9]    <=============== 
 ===============>  Candidate: SmallGroup(24, 12), H=cc[7], K=cc[8]    <=============== 
 ===============>  Candidate: SmallGroup(24, 12), H=cc[8], K=cc[9]    <=============== 
 ===============>  Candidate: SmallGroup(24, 13), H=cc[8], K=cc[9]    <=============== 
 The candidates are: 
[ [ 16, 3, 7, 10 ], [ 16, 3, 7, 12 ], [ 16, 3, 11, 12 ], [ 16, 11, 16, 18 ], [ 16, 11, 17, 19 ], [ 18, 3, 5, 7 ], [ 18, 4, 7, 8 ], 
  [ 18, 4, 7, 9 ], [ 18, 4, 7, 10 ], [ 18, 4, 8, 9 ], [ 18, 4, 8, 10 ], [ 18, 4, 9, 10 ], [ 24, 6, 6, 10 ], [ 24, 6, 7, 11 ], 
  [ 24, 6, 10, 12 ], [ 24, 6, 11, 12 ], [ 24, 8, 6, 11 ], [ 24, 8, 8, 10 ], [ 24, 8, 8, 11 ], [ 24, 8, 10, 12 ], [ 24, 8, 11, 12 ], 
  [ 24, 12, 4, 9 ], [ 24, 12, 7, 8 ], [ 24, 12, 8, 9 ], [ 24, 13, 8, 9 ] ]
gap> G:=SmallGroup(18,3);
<pc group of size 18 with 3 generators>
gap> StructureDescription(G);
"C3 x S3"
gap> cc:=ConjugacyClassesSubgroups(G);
[ Group( <identity> of ... )^G, Group( [ f1 ] )^G, Group( [ f3 ] )^G, Group( [ f2 ] )^G, Group( [ f2*f3 ] )^G, Group( [ f1, f3 ] )^G, 
  Group( [ f1, f2 ] )^G, Group( [ f2, f3 ] )^G, Group( [ f2, f3, f1 ] )^G ]
gap> U:=Representative(cc[5]);
Group([ f2*f3 ])
gap> H:=Representative(cc[7]);
Group([ f1, f2 ])
gap> StructureDescription(H);
"C6"
gap> StructureDescription(U);
"C3"
gap> Read("PermutingSubgroups.g");
gap> Normalizes(U,H);
false
gap> Normalizes(H,U);
false
gap> ArePermting(U,H);
Variable: 'ArePermting' must have a value

gap> ArePermuting(U,H);
true
gap> UH:=Group(Concatenation(GeneratorsOfGroup(U),GeneratorsOfGroup(H)));
<pc group with 3 generators>
gap> StructureDescription(UH);
"C3 x S3"
gap> U0:=Intersection(U,H);
Group([  ])
gap> IntermediateSubgroups(U,U0);
rec( subgroups := [  ], inclusions := [ [ 0, 1 ] ] )
gap> U:=Representative(cc[7]);
C6
gap> H:=Representative(cc[5]);
C3
gap> IntermediateSubgroups(U,U0);
rec( subgroups := [ Group([ f1 ]), Group([ f2 ]) ], inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
gap> intU0U:=IntermediateSubgroups(U,U0);
rec( subgroups := [ Group([ f1 ]), Group([ f2 ]) ], inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
gap> intHUH:=IntermediateSubgroups(UH,H);
rec( subgroups := [ Group([ f2*f3, f3 ]) ], inclusions := [ [ 0, 1 ], [ 1, 2 ] ] )
gap> K:=intHUH.subgroups[1];
Group([ f2*f3, f3 ])
gap> StructureDescription(K);
"C3 x C3"
gap> X:=intU0U.subgroups[1];
Variable: 'X' is read only
not in any function
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' after making it writable to continue
brk> quit;
gap> V:=intU0U.subgroups[1];
Group([ f1 ])
gap> W:=intU0U.subgroups[2];
Group([ f2 ])
gap> StructureDescription(K);
"C3 x C3"
gap> StructureDescription(V);
"C2"
gap> StructureDescription(W);
"C3"
gap> ArePermuting(K,V);
true
gap> ArePermuting(K,W);
true
gap> ArePermuting(W,K);
true
gap> ArePermuting(V,K);
true
gap> ArePermuting(H,V);
false
gap> ArePermuting(H,W);
true
gap> HcapK:=Intersection(H,K);
C3
gap> HcapK=W;
false
gap> Elements(W);
[ <identity> of ..., f2, f2^2 ]
gap> UcapK:=Intersection(U,K);
Group([ f2, f2^2 ])
gap> UcapK=W;
true
gap> V;
C2
gap> W;
C3
gap> Elements(H);
[ <identity> of ..., f2*f3, f2^2*f3^2 ]
gap> Elements(V);
[ <identity> of ..., f1 ]
gap> Elements(W);
[ <identity> of ..., f2, f2^2 ]
gap> Order(f1);
Variable: 'f1' must have a value

gap> GeneratorsOfGroup(G);
[ f1, f2, f3 ]
gap> gens:=GeneratorsOfGroup(G);
[ f1, f2, f3 ]
gap> Order(gens[1]);
2
gap> Order(gens[2]);
3
gap> Order(gens[3]);
3
gap> Elements(G);
[ <identity> of ..., f1, f2, f3, f1*f2, f1*f3, f2^2, f2*f3, f3^2, f1*f2^2, f1*f2*f3, f1*f3^2, f2^2*f3, f2*f3^2, f1*f2^2*f3, f1*f2*f3^2, 
  f2^2*f3^2, f1*f2^2*f3^2 ]
gap> GeneratorsOfGroup(K);
[ f2*f3, f3 ]
gap> GeneratorsOfGroup(H);
[ f2*f3 ]
gap> GeneratorsOfGroup(U);
[ f1, f2 ]
gap> G;
C3 x S3
gap> G:=SmallGroup(18,3);
<pc group of size 18 with 3 generators>
gap> G;
<pc group of size 18 with 3 generators>
gap> Presentation(G);
Variable: 'Presentation' must have a value

gap> PresentationRegularPermutationGroup(G);
Error, the given group must be a regular permutation group called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> PresentationFPGroup(G);
Variable: 'PresentationFPGroup' must have a value

gap> PresentationFpGroup(G);
Error, <G> must be a finitely presented group called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> HELP("Presentation");
gap> Elements(G);
[ <identity> of ..., f1, f2, f3, f1*f2, f1*f3, f2^2, f2*f3, f3^2, f1*f2^2, f1*f2*f3, f1*f3^2, f2^2*f3, f2*f3^2, f1*f2^2*f3, f1*f2*f3^2, 
  f2^2*f3^2, f1*f2^2*f3^2 ]
gap> RelatorsOfFpGroup(G);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `RelatorsOfFpGroup' on 1 arguments called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> RelatorRepresentatives(G);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `LetterRepAssocWord' on 1 arguments called from
LetterRepAssocWord( rel ) called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> quit;
gap> HELP("Relators");
gap> HELP("1");
gap> Read("PermutingSubgroups.g");
gap> ArePermuting(U,H);
true
gap> ArePermuting(V,H);
false
gap> ArePermuting(W,H);
true
gap> Read("PermutingSubgroups.g");
gap> Normalizes(H,U);
false
gap> Normalizes(U,H);
false
gap> G;
<pc group of size 18 with 3 generators>
gap> p:=FamilyPcgs(G);
Pcgs([ f1, f2, f3 ])
gap> iso:=IsomorphismFpGroupByPcgs(p,"g");
[ f1, f2, f3 ] -> [ g1, g2, g3 ]
gap> F:=Image(iso);
<fp group of size 18 on the generators [ g1, g2, g3 ]>
gap> RelatorsOfFpGroup(F);
[ g1^2, g2^-1*g1^-1*g2*g1, g3^-1*g1^-1*g3*g1*g3^-1, g2^3, g3^-1*g2^-1*g3*g2, g3^3 ]
gap> ccsg:=ConjugacyClassesSubgroups(F);
[ Group( <identity ...> )^G, Group( [ g1 ] )^G, Group( [ g2 ] )^G, Group( [ g3 ] )^G, Group( [ g2*g3 ] )^G, Group( [ g1, g3 ] )^G, 
  Group( [ g1, g2 ] )^G, Group( [ g2, g3 ] )^G, Group( [ g1, g2, g3 ] )^G ]
gap> U:=Representative(ccsg[7]);
Group([ g1, g2 ])
gap> H:=Representative(ccsg[5]);
Group([ g2*g3 ])
gap> ArePermuting(U,H);
true
gap> Normalizes(U,H);
false
gap> Normalizes(H,U);
false
gap> GeneratorsOfGroup(U);
[ g1, g2 ]
gap> GeneratorsOfGroup(H);
[ g2*g3 ]
gap> UH:=ClosureGroup(U,H);
Group(<fp, no generators known>)
gap> UH=F;
true
gap> intHUH:=IntermediateSubgroups(UH,H);
rec( subgroups := [ Group(<fp, no generators known>) ], inclusions := [ [ 0, 1 ], [ 1, 2 ] ] )
gap> K:=intHUH.subgroups[1];
Group(<fp, no generators known>)
gap> GeneratorsOfGroup(K);
[ g2, g3 ]
gap> #intU0U:=IntermediateSubgroups(U,U0);
gap> U0:=Intersection(U,H);
Group(<fp, no generators known>)
gap> Order(U0);
1
gap> intU0U:=IntermediateSubgroups(U,U0);
rec( subgroups := [ Group(<fp, no generators known>), Group(<fp, no generators known>) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
gap> V:=intU0U.subgroups[1];
Group(<fp, no generators known>)
gap> W:=intU0U.subgroups[2];
Group(<fp, no generators known>)
gap> GeneratorsOfGroup(U);
[ g1, g2 ]
gap> GeneratorsOfGroup(W);
[ g2 ]
gap> GeneratorsOfGroup(V);
[ g1 ]
gap> Order(W);
3
gap> Order(V);
2
gap> RelatorsOfFpGroup(F);
[ g1^2, g2^-1*g1^-1*g2*g1, g3^-1*g1^-1*g3*g1*g3^-1, g2^3, g3^-1*g2^-1*g3*g2, g3^3 ]
gap> G;
<pc group of size 18 with 3 generators>
gap> G;
<pc group of size 18 with 3 generators>
gap> 