findSpecialParachutesInG:=function(args)
#  findParachutesInG([G,core,minsz,maxsz,newcnt,ncfcnt,outfile,datfile]);
    local k, kk, jj, first, indx, e, cc, numcc, numpg, lats, latsize, obtained, intSubs, H, perm, t, prefix, ignore, answer, 
          pgroup, strucG, strucH, n1, n2, abelian, solvable, cores, corefree, nargin, Atoms, incls,
          BETA, VERBOSE, complements, TG, filename, C,
          G,core,minsz,maxsz,newcnt,ncfcnt,outfile,datfile;
    
    nargin := Length(args);
    
    if nargin < 9 then
        prefix := "findParachutes";
        # This one stores output in human readable format:
        filename := Concatenation(prefix, ".out");
        outfile := OutputTextFile(filename, false);
        SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
        
        # This one stores output in format that will be read in by BatchCovers2Hasse.m Matlab routine:
        filename := Concatenation(prefix, ".dat");
        datfile := OutputTextFile(filename, false);
        SetPrintFormattingStatus(datfile, false);   # This prevents automatic indentation and line breaks.
    else
        outfile:=args[8]; datfile:=args[9];
    fi;    
    if nargin<7 then newcnt:=0; ncfcnt:=0;  else newcnt:=args[6]; ncfcnt:=args[7]; fi;
    if nargin<5 then minsz:=6;  maxsz:=40; else minsz:=args[4];  maxsz:=args[5]; fi;
    if nargin < 3 then core:=0; else core:=args[3]; fi;
    if nargin < 1 then Error("usage: findParachutesInG([G, ...]);");  else G:=args[1]; fi;
    if nargin < 2 then C:=Group([One(G)]); else C:=args[9];
    
    cores:=[];
    
    # lats :=  [[[]]] ;  # stores lattices we have found 
    # lats[j] is a list of lists of lists e.g.
    # lats[5] = [ [ [0,1],[0,2],[1,3],[2,4],[3,4] ], [ [0,1],[0,2],[0,3],[1,4],[2,4],[3,4] ] ]
    # indicates that we have found two 5-element lattices (N5 and M3).
    lats:=[[]];  # for now we only care about repeats within a given group
    
    # e := Group([Identity(G)]);
    cc := ConjugacyClassesSubgroups(G);
    numcc := Size(cc);
                    
    first:=2;  # I THINK the penultimate conjugacy class rep is always a maximal subgroup
    
    # It makes more sense to start with the last conjugacy class and work down, 
    # so that you can record the interval of minimal index for the given group.
    for k in [first..(numcc-1)] do
        H:= Representative(cc[numcc-k]);
        obtained:=false;   # indicator (have we seen this lattice already?)
        
        # Check that H is above C
        if IsSubgroup(H,C) then
            # Check that H is core-free.
            corefree:=true; # First, assume it is.
            if core=0 and Order(H)>1 then
                answer:=IsCorefree([G,H,cores]);
                corefree:=answer[1];
                cores:=answer[2];
            fi;
            if not corefree then
                ncfcnt:=ncfcnt+1;
            else
                intSubs := IntermediateSubgroups(G, H);
                latsize := Size(intSubs.subgroups)+2;
                if minsz <= latsize and latsize <= maxsz then
                    Atoms:=[];
                    # Check that it's a parachute; i.e. atoms are pairwise complements
                    for kk in [1..Size(intSubs.inclusions)] do
                        if intSubs.inclusions[kk][1]=0 then
                            Add(Atoms,intSubs.subgroups[kk]);
                        fi;
                    od;
                    if Size(Atoms)>1 then
                        complements:=true;
                        for kk in [1..Size(Atoms)-1] do
                            if complements then
                                for jj in [kk+1..Size(Atoms)] do
                                    if not Complements(G, H, Atoms[kk], Atoms[jj]) then
                                    complements:=false;
                                    break;
                                fi;
                            od;
                        else
                            break;
                        fi;
                    od;
                    if complements then
                        #Print(">> found a chute;  atoms:\n", Atoms, "\n");
                        incls := SSortedList(intSubs.inclusions);
                        #if norepeats=-1 then
                        #newcnt:=newcnt+1;
                        #else
                        if IsBound(lats[latsize]) then
                            # check if we're already seen [H, G] 
                           if incls in lats[latsize] then
                                obtained:=true;
                            # elif norepeats=1 then # really check carefully
                            #     for t in [1..Size(lats[latsize])] do
                            #         if isIsomorphicInterval(lats[latsize][t], incls) then
                            #             obtained:=true;
                            #             break;
                            #         fi;
                            #     od;
                            fi;
                            if not obtained then
                                # add this lattice to the list of representable lattices
                                Add(lats[latsize], incls);
                                newcnt:=newcnt+1;
                            fi;
                        else  # (we haven't seen any intervals of this size yet)
                            lats[latsize]:=[incls];
                            newcnt:=newcnt+1;
                        fi;
                        if not obtained then
                            indx:=Index(G,H);
                            Print("\n", newcnt, ".(", latsize, ") " );
                            Print(" H = CC[", numcc-k, "]  Index: ", indx, ", ",  incls, "\n"); 
                            AppendTo(outfile, "\n", newcnt, ".(", latsize, ") " );
                            AppendTo(outfile, " H = CC[", numcc-k, "]  Index: ", indx, ", ",  incls, "\n"); 
                            AppendTo(datfile, incls,"; (",latsize, ")  H = CC[",numcc-k,"], Index ", indx, "; \n");
                        fi;
                    fi;
                fi;
            fi;
        fi;
    od;
    return [newcnt,ncfcnt];
end;;

# Complements:=function(G, H, A1, A2)
# For A1 and A2, subgroups of G containing H, check if A1 and A2
# are complements in [H,G] -- i.e. they intersect at H and generate G.
Complements:=function(G, H, A1, A2)
    if G=Group(Concatenation(GeneratorsOfGroup(A1),GeneratorsOfGroup(A2))) and 
       H=Intersection(A1,A2) then
        return true;
    else
        return false;
    fi;
end;;
