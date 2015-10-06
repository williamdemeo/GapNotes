# This is GAP code for searching for an example of an 
# upper interval of the form suggested by Ralph in seminar
# today (Thursday 20120412).
# i.e. a 2x2 above H, and an adjoined ordinal sum
# of 2 + 2x2 as the interval [U0, U]
#
# Update: this does not occur, as proved by me in 
# Interval Enforceable Properties paper: http://arxiv.org/abs/1205.1927

N1:=400;
N2:=511;
candidates:=[];
for i in [N1..N2] do
    ng:=NrSmallGroups(i);
    Print("Checking the ", ng, " group(s) of order ", i, "\n");
    for j in [1..ng] do
        G:=SmallGroup(i,j);
        ccsg:=ConjugacyClassesSubgroups(G);
        nccsg:=Length(ccsg);
        for k in [1..nccsg] do
            H:=Representative(ccsg[k]);
            core:=Core(G,H);
            # H should be core-free
            if Order(core) = 1 then
                intsubs:=IntermediateSubgroups(G,H);
                len:=Length(intsubs.inclusions);
                # There should be 13 coverings.
                if len=13 then
                    Print("===============>  Candidate: SmallGroup(", i, ", ", j, "), ccsg[", k, "]   <=============== \n ");
                    Print(intsubs.inclusions, "\n");
                    Add(candidates, [i,j,k]);
                fi;
            fi;
        od;
    od;
od;

Print("The candidates are: \n");
Print(candidates, "\n");
