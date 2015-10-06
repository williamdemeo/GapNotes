# Gap function for finding an M7 upper interval in a give group G.
#
# Author: William DeMeo <williamdemeo@gmail.com>
# Date: 2010.08.02

findM7InG:=function(g)
    
    local pathname, filename, outfile, i, j, k, p, q, r, s, t, u, v, numsg, G, H, ms, numms, count, intSubs, numintSubs, 
          msind, zeros, threes, mark, coreflag, core,ccsg;
    
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/findM7InG.out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    ccsg:=ConjugacyClassesSubgroups(g);
    for i in [2..Length(ccsg)-1] do
        G:=Representative(ccsg[i]);
        ms := MaximalSubgroupClassReps(G);
        numms := Size(ms);
        # p is the 1st atom
        for p in [1..(numms-6)] do
            # q is the 2nd atom
            for q in [(p+1)..(numms-5)] do
                H := Intersection(ms[p],ms[q]);
                
                # Test whether interval [H, G] has exactly 9 subgroups (including H and G);
                # but since GAP doesn't count H and G, check whether numintSubs is 7.
                intSubs := IntermediateSubgroups(G, H);
                numintSubs := Size(intSubs.subgroups);
                if numintSubs = 7 then
                    
                    # r is the 3rd atom
                    for r in [(q+1)..(numms-4)] do
                        if H = Intersection(ms[p],ms[r]) and 
                           H = Intersection(ms[q],ms[r]) then
                            
                            # s is the 4th atom
                            for s in [(r+1)..(numms-3)] do
                                if H = Intersection(ms[p],ms[s]) and 
                                   H = Intersection(ms[q],ms[s]) and
                                   H = Intersection(ms[r],ms[s]) then
                                    
                                    # t is the 5th atom
                                    for t in [(s+1)..(numms-2)] do
                                        if H = Intersection(ms[p],ms[t]) and 
                                           H = Intersection(ms[q],ms[t]) and
                                           H = Intersection(ms[r],ms[t]) and 
                                           H = Intersection(ms[s],ms[t]) then
                                            
                                            # u is the 6th atom
                                            for u in [(t+1)..(numms-1)] do
                                                if H = Intersection(ms[p],ms[u]) and 
                                                   H = Intersection(ms[q],ms[u]) and
                                                   H = Intersection(ms[r],ms[u]) and 
                                                   H = Intersection(ms[s],ms[u]) and
                                                   H = Intersection(ms[t],ms[u]) then
                                                    
                                                    # v is the 7th atom
                                                    for v in [(u+1)..numms] do
                                                        if H = Intersection(ms[p],ms[v]) and 
                                                           H = Intersection(ms[q],ms[v]) and
                                                           H = Intersection(ms[r],ms[v]) and 
                                                           H = Intersection(ms[s],ms[v]) and
                                                           H = Intersection(ms[t],ms[v]) and
                                                           H = Intersection(ms[u],ms[v]) 
                                                           then
                                                            msind := List([p, q, r, s, t, u, v]);
                                                            Print("\nFOUND A POSSIBLE EXAMPLE: [H, G] = [", StructureDescription(H),", ", StructureDescription(G), "]\n",
                                                                  "                            G = ccsg[", i,"], atom1=ms[",p,"], atom2=ms[",q,"] \n",
                                                                  "                            [p,q,r,s,t,u,v] = ", msind, "\n");
                                                            
                                                            AppendTo(outfile, "\n [H, G] = [", StructureDescription(H),", ", StructureDescription(G), "]\n",
                                                                    " G = ccsg[", i,"], atom1=ms[",p,"], atom2=ms[",q,"] \n",
                                                                    " [p,q,r,s,t,u,v] = ", msind, "\n");
                                                        fi;
                                                    od;  # v
                                                fi; 
                                            od;  # u  
                                        fi; 
                                    od;   # t
                                fi;
                            od; # s
                        fi;
                    od;  # r
                fi;
            od;
        od;
    od;
end;;
    
    