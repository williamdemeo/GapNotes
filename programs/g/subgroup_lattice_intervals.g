# File: subgroup_lattice_intervals.g
# Author: William DeMeo
# Date: 2015.10.06
#
# Description: Basic methods for identifying congruence lattices of a group actions.
#
# Send questions, comments, suggestions to williamdemeo@gmail.com
#

G:=AlternatingGroup(5);;
ccsg:=ConjugacyClassesSubgroups(G);;                   
H:=Representative(ccsg[2]);;        
act:=Action(G,RightCosets(G,H),OnRight);;
ms:=MaximalSubgroupClassReps(G);;
# for k in [1..Size(ms)] do
K:=ms[2];
sms:=MaximalSubgroupClassReps(K);;
# for h in [1..Size(sms)] do
H:=sms[1];
intSubs := IntermediateSubgroups(G, H);
#incls := SSortedList(intSubs.inclusions);;

# Start with the dihedral group on 16 elements acting on itself.
g:=DihedralGroup(14);
act:=Action(g,g,OnRight);
blks:=AllBlocks(act);
Orbit(act,blks[1],OnSets)-1;
Orbit(act,blks[2],OnSets)-1; % etc., gives:
  
e := Group([Identity(G)]);


# for k in [1..NrSmallGroups(18)] do
#     Print(k, "   ", StructureDescription(SmallGroup(18,k)), "\n");
# od
G:=SmallGroup(18,4) # (C3 x C3) : C2
ccsg:=ConjugacyClassesSubgroups(G);;                   
for k in [1..Size(ccsg)] do 
    H:=Representative(ccsg[k]);;
    act:=Action(G,RightCosets(G,H),OnRight);;
    blks:=AllBlocks(act);
    Print("\n k=", k);
    for j in [1..Size(blks)] do
        Print("\n    j=",j, "  : ", Orbit(act,blks[j],OnSets)-1);
    od;
od;

for k in [1..Size(ccsg)] do 
    H:=Representative(ccsg[k]);;
    Print(k, IsNormal(G,H), "\n");
od;

H:=Representative(ccsg[3]);;
IntermediateSubgroups(G,H);  

   filterHcapK := 
for k in [1..Size(filterHcapK.subgroups)] do
    StructureDescription(filterHcapK.subgroups[k]); 
od;
