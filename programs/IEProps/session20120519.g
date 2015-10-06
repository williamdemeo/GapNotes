# Examples of permuting subgroups which do not normalize each other.
# author: williamdemeo@gmail.com
# date: 2012.05.19

# Example 1: 
G:=SmallGroup(18,3);      # C3 x S3
cc:=ConjugacyClassesSubgroups(G);;
U:=Representative(cc[7]);;  # C6
H:=Representative(cc[5]);;  # C3
Read("PermutingSubgroups.g");
ArePermuting(U,H);  # returns true
Normalizes(U,H);    # returns false
Normalizes(H,U);    # returns false
#UH:=Group(Concatenation(GeneratorsOfGroup(U),GeneratorsOfGroup(H)));  # C3 x S3
UH:=ClosureGroup(U,H);  # C3 x S3
U0:=Intersection(U,H);  # Group([ ]);
intU0U:=IntermediateSubgroups(U,U0);  # 2 x 2
intHUH:=IntermediateSubgroups(UH,H);  # 3
K:=intHUH.subgroups[1];  # C3 x C3
V:=intU0U.subgroups[1];  # C2
W:=intU0U.subgroups[2];  # C3
ArePermuting(H,V);       # returns false
ArePermuting(H,W);       # returns true
# So intersection of K with U should be W:
UcapK:=Intersection(U,K);
UcapK=W;   # returns true


# Redo the example using a different presentation of the group
# in order to accurately describe the group (e.g. in slides for OSU talk).
G:=SmallGroup(18,3);      # C3 x S3
p:=FamilyPcgs(G);
iso:=IsomorphismFpGroupByPcgs(p,"g");  # [ f1, f2, f3 ] -> [ g1, g2, g3 ]
F:=Image(iso);
# <fp group of size 18 on the generators [ g1, g2, g3 ]>
RelatorsOfFpGroup(F);
# [ g1^2, g2^-1*g1^-1*g2*g1, g3^-1*g1^-1*g3*g1*g3^-1, g2^3, g3^-1*g2^-1*g3*g2, g3^3 ]
cc:=ConjugacyClassesSubgroups(F);
U:=Representative(ccsg[7]);  # Group([ g1, g2 ]) = C6
H:=Representative(ccsg[5]);  # Group([ g2*g3 ]) = C3
ArePermuting(U,H);           # true
Normalizes(U,H);             # false
Normalizes(H,U);             # false
UH:=ClosureGroup(U,H);
UH=F;                        # true
intHUH:=IntermediateSubgroups(UH,H);
# rec( subgroups := [ Group(<fp, no generators known>) ], inclusions := [ [ 0, 1 ], [ 1, 2 ] ] )
K:=intHUH.subgroups[1];
GeneratorsOfGroup(K);        # [ g2, g3 ]
U0:=Intersection(U,H);
Order(U0);                   # 1
intU0U:=IntermediateSubgroups(U,U0);
rec( subgroups := [ Group(<fp, no generators known>), Group(<fp, no generators known>) ], 
  inclusions := [ [ 0, 1 ], [ 0, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
V:=intU0U.subgroups[1];     # Group([ g1 ])
W:=intU0U.subgroups[2];     # Group([ g2 ])



### OLD ###


