# Construction of Feit's M_7 upper interval in GAP
#
# Author: williamdemeo@gmail.com
# Date: 2011.01.27
# Thanks: Alexander Hulpke for help getting the right SL(5,2) subgroups;
#         see GAP forum thread: 
#         "Basic question: picking out a certain subgroup of A_{31}"
#
s31:=SymmetricGroup(31);
a31:=AlternatingGroup(31);
G:=SL(5,2);
vecs:=Filtered(Elements(GF(2)^5),x->not IsZero(x));;  # the non-zero vectors in {0,1}^5
Length(vecs);               # returns 31 = 2^5-1
K1:=Action(G,vecs,OnRight);
P:=SylowSubgroup(K1,31);
H:=Normalizer(K1,P);      
N:=Normalizer(a31,H);     
NN:=Normalizer(s31,H);     
Order(NN);                  # returns 930=31.30
Order(N);                   # returns 465=31.15
Order(H);                   # returns 155=31.5

NmodH:=RightCosets(N,H);    
g1:=Representative(NmodH[2]);  g2:=Representative(NmodH[3]);

NNmodH:=RightCosets(NN,H);  
gg1:=Representative(NNmodH[2]); gg2:=Representative(NNmodH[3]);
gg3:=Representative(NNmodH[4]); gg4:=Representative(NNmodH[5]);
gg5:=Representative(NNmodH[6]);

K11:=K1^g1; K12:=K1^g2;     # The coatoms so far: K1, K11, K12, N
K21:=K1^gg1; K22:=K1^gg2;   # K21=K11, but K22 is a new coatom above H
K23:=K1^gg3; K24:=K1^gg4;   # K23 and K24 are two more new coatoms
K25:=K1^gg5;                # but K25=K12

# Finally, the seven coatoms above H are: 
# K1, K11, K12, K22, K23, K24, N, and the interval [H,A31] is
#
#                  A31
#
#       /    /   /  |  \   \   \
#     /    /    /   |   \    \   \
#   K1   K11  K12  K22  K23  K24  \
#     \    \    \   |   /    /    N
#       \    \   \  |  /   /     /
#
#                   H

IsSubgroup(K11,H);          # true
IsSubgroup(K12,H);          # true
IsSubgroup(K21,H);          # true
IsSubgroup(K22,H);          # true
IsSubgroup(K23,H);          # true
IsSubgroup(K24,H);          # true

L:= GraphicSubgroupLattice(a31);
InsertVertex(L,H);
InsertVertex(L,N);
InsertVertex(L,K1);
InsertVertex(L,K11);        # <-- never finishes
