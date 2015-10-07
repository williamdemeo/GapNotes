# Some examples of groups G with [H,G] \cong M_4 and Core(G,H)=().
#
# williamdemeo@gmail.com [2011.05.12]
#
# 1. G=S_3, H=().  (Shareshian type 2)
s3:=SymmetricGroup(3);;
ccsg:=ConjugacyClassesSubgroups(s3);;
# returns [ Group( () )^G, Group( [ (2,3) ] )^G, Group( [ (1,2,3) ] )^G, Group( [ (1,3,2), (1,2) ] )^G ]
# The atoms of the M_4 are:
# Group( [ (1,2,3) ] ) (normal), and the three (core-free) subgroups in the 2nd conjclass of subgroups:
# Group( [ (1,2) ] ), Group( [ (1,3) ] ), Group( [ (2,3) ] )
#
# 2. G=C3xC3, H=().  (Shareshian type 1)
#

# 3. G=(C3xC3):C2,  H=C2  (Shareshian type 1)
# First, we find it among GAP's list of groups of order 18:
List([1..5], x->StructureDescription(SmallGroup(18,x)));
# returns [ "D18", "C18", "C3 x S3", "(C3 x C3) : C2", "C6 x C3" ]
G:=SmallGroup(18,4);;
ccsg:=ConjugacyClassesSubgroups(G);;
List(ccsg, x->StructureDescription(Representative(x)));
# returns [ "1", "C2", "C3", "C3", "C3", "C3", "S3", "S3", "S3", "S3", "C3 x C3", "(C3 x C3) : C2" ]
H:=Representative(ccsg[2]);
intHG:=IntermediateSubgroups(G,H);
# returns 
# rec( subgroups := [ Group([ f1, f2 ]), Group([ f1, f3 ]), Group([ f1, f2*f3 ]), Group([ f1, f2^2*f3 ]) ], 
#     inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
# which shows [H,G] is an M_4.  
# Also, H is corefree, but each of the intermediate subgroups has nontrivial core:
Core(G,H);  # returns Group([  ])
List([1..4], x->Core(G,intHG.subgroups[x]));
# returns [ Group([ f2, f2^2 ]), Group([ f3, f3^2 ]), Group([ f2*f3, f2^2*f3^2 ]), Group([ f2^2*f3, f2*f3^2 ]) ]
List(last, x->StructureDescription(x));  # returns [ "C3", "C3", "C3", "C3" ]

# 4. Jack Schmidt's Example: 
# G=((C3xC3):C2)x((C3xC3):C2):C2,  H:=(C2xC2):C2  (Shareshian type 1)
G:=SmallGroup(648,725);
StructureDescription(G);
ms:=MaximalSubgroupClassReps(G);
# [ ((C3xC3):C2)x((C3xC3):C2), ((C3xC3):C2)x((C3xC3):C2), 
#   (C3xC3xC3xC3):C4, (S3xS3):C2, (S3xS3):C2, (S3xS3):C2, (S3xS3):C2 ]

# From the results of a previous search, we happen to know that a suitable H 
# is the 4th second maximal subgroup below the 4th maximal subgroup:
K:=ms[4];  #  (S3xS3):C2   (4th maximal subgroup)
msK:=MaximalSubgroupClassReps(K);  # [ S3xS3, S3xS3, (C3xC3):C4, D8 ]
H:=msK[4];  #  D8 (4th second maximal subgroup)
Core(G,H);  # returns  Group([  ])  (corefree)
intHG:=IntermediateSubgroups(G,H);
# rec( subgroups := [ Group([ f1, f2, f3, f4, f5 ]), Group([ f1, f2, f3, f6, f7 ]), 
#      Group([ f1, f2, f3, f4*f7, f5*f6 ]), Group([ f1, f2, f3, f4^2*f7, f5^2*f6 ]) ], 
#      inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
List(intHG.subgroups, x->StructureDescription(x));
# [ (S3xS3):C2, (S3xS3):C2, (S3xS3):C2, (S3xS3):C2 ]
List(intHG.subgroups, x->Core(G,x));
# [ C3xC3, C3xC3, C3xC3, C3xC3 ]
  
gap> G;
Group([ f1, f2, f3 ])
gap> StructureDescription(G);
"(C3 x C3) : C2"
gap> intHG;
rec( subgroups := [ Group([ f1, f2 ]), Group([ f1, f3 ]), Group([ f1, f2*f3 ]), 
      Group([ f1, f2^2*f3 ]) ], inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 4 ], [ 1, 5 ], 
      [ 2, 5 ], [ 3, 5 ], [ 4, 5 ] ] )
gap> List(intHG.subgroups, x->StructureDescription(x));
[ "S3", "S3", "S3", "S3" ]
gap> ccsg;
[ Group( () )^G, Group( [ (2,3) ] )^G, Group( [ (1,2,3) ] )^G, Group( [ (1,3,2), (1,2) ] )^G ]
gap> List(ccsg, x->StructureDescription(Representative(x)));
[ "1", "C2", "C3", "S3" ]
gap> List(ccsg, x->IsNormal(s3,Representative(x)));
[ true, false, true, true ]
  gap> 
  
  
# Palfy's example (this is not an M_4, but it's useful to keep in mind)
gg:=SmallGroup(72,40);;   # (S3xS3):C2
msgg:=MaximalSubgroupClassReps(gg);  # [ "S3 x S3", "S3 x S3", "(C3 x C3) : C4", "D8" ]
msk:=MaximalSubgroupClassReps(msgg[1]);  # [ "C3 x S3", "(C3 x C3) : C2", "C3 x S3", "D12", "D12" ]
k:=msgg[4];  # this is D8 which is isomorphic to (C2xC2):C2
msk:=MaximalSubgroupClassReps(k);  # [ "C2 x C2", "C2 x C2", "C4" ]
h:=msk[1];  #  C2 x C2
inthgg:=IntermediateSubgroups(gg,h);
# rec( subgroups := [ Group([ f1, f2, f3 ]), Group([ f1, f3, f4 ]), Group([ f1, f3, f5 ]), Group([ f1, f3, f4, f5 ]) ], 
#     inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 5 ], [ 2, 4 ], [ 3, 4 ], [ 4, 5 ] ] )
Core(gg,h);  #Group([  ])  (corefree)