# Examples of permuting subgroups which do not normalize each other.
# author: williamdemeo@gmail.com
# date: 2012.06.11

# Example 2: 
G:=SmallGroup(24,12);
StructureDescription(G);  # "S4"
cc:=ConjugacyClassesSubgroups(G);;
H:=Representative(cc[4]);;
StructureDescription(H);   # "C3"
U:=Representative(cc[9]);;
StructureDescription(U);   # "D8"

Read("PermutingSubgroups.g");
ArePermuting(U,H);         # true
Normalizes(U,H);           # false
Normalizes(H,U);           # false
CUH:= CommutatorSubgroup(U,H);;
StructureDescription(CUH); # "A4"
IsSubgroup(CUH,H);         # true
IsSubgroup(CUH,U);         # false

# Locate the subgroups of U that permute with H
SubU:=IntermediateSubgroups(U,Group([One(U)]));
List(SubU.subgroups, x->ArePermuting(x,H));
# [ false, false, false, true, false, true, false, false ]
# so the fourth and sixth subgroups permute with H

W:=SubU.subgroups[4];      # "C2"
V:=SubU.subgroups[6];      # "C2 x C2"
IsSubgroup(CUH,V);         # true
CVH:=CommutatorSubgroup(V,H); # "C2 x C2"
CVH=V;                        # true
CWH:=CommutatorSubgroup(W,H); # "C3"
CWH=H;                        # true
