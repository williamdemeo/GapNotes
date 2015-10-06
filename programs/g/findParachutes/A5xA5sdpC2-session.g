# Goal:  Look at interesting upper intervals in the group G=A5xA5:C2, 
#        which is the smallest group of the form wr(S,Cn) with n>1 
#        and S nonabelian simple.
#    
#        By "interesting" we ideally want to find a corefree subgroup 
#        H above C2 such that [H,G] is a parachute or an L-P lattice.
#
# 2012.10.20

G:=PrimitiveGroup(25,23);;
cc:=ConjugacyClassesSubgroups(G);;
N:=Representative(cc[102]);;   # A5xA5
C2:=Representative(cc[3]);;    # C2

# check that N join C = G and N meet C = ();
Intersection(N,C2);            # Group(());
Read("../GroupGeneratedBy.g");
gg:=Join([N,C2]);;
gg=G;                          # true

for k in [1..4] do 
    K:=Representative(cc[k]); 
    
    if IsSubgroup(K,C2) then   # We are only looking at groups above C2.
                               # (alternatively, might look at intervals [V,N] in N=A5xA5, then
                               #  take join of V with C2 and check upper interval [Join([V,C2]), G])
        core:=Core(G,K);
        if Order(core)=1 then  # We are only interested in corefree K.
            intKG:=IntermediateSubgroups(G,K);
            Print("\n", k, "  ", Length(intKG.subgroups)+2, "  ", StructureDescription(K), "  ", Core(G,K), "  ", intKG.inclusions, "\n");
        fi;
    fi;
od;
