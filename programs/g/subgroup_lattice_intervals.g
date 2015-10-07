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


