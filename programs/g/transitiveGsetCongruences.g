isIsomorphicInterval:=function(list1, list2)
    # Gap function for testing whether two sets of covering relations 
    # are the same modulo relabelling. 
    
    local n, m, j, list3, G, p, e;
    
    if not IsList(list1) or not IsList(list2) then
        Error("usage: isIsomorphicInterval( <lst1>, <lst2> );");
    fi;
    if Length(list1) <> Length(list2)  then
        return false;
    fi;
        
    list1 := SSortedList(list1);
    list2 := SSortedList(list2);

    n:=Length(list1);
    
    m:=Maximum(Maximum(list1));
  
    G:=SymmetricGroup(m);
    e := Group([Identity(G)]);
    
    for p in Elements(G) do
        if p<>e and SmallestMovedPoint(p)>1 and LargestMovedPoint(p)<m then
            list3 := [[ ]];
            for j in [1..n] do
                list3[j]:=List(list1[j], x->((x+1)^p)-1); 
            od;
            list3:=SSortedList(list3);
            if list3=list2 then
                return true;
            fi;
        fi;
    od;
    return false;
end;

isIsomorphicIntervalQuick:=function(list1, list2)
    # Gap function for testing whether two sets of covering relations 
    # are the same modulo relabelling. 
    
    local n, m, j, k, q, list3, G, p, e;
    
    if not IsList(list1) or not IsList(list2) then
        Error("usage: isIsomorphicInterval( <lst1>, <lst2> );");
    fi;
    if Length(list1) <> Length(list2)  then
        return false;
    fi;
        
    list1 := SSortedList(list1);
    list2 := SSortedList(list2);

    n:=Length(list1);
    
    m:=Maximum(Maximum(list1));
  
    #G:=SymmetricGroup(m);
    #e := Group([Identity(G)]);
    
    #q:=(m+RemInt(m,2))/2;
    for q in [2..4] do
        for k in [q+1..m-1] do
            p:=(q,k);
            list3 := [[ ]];
            for j in [1..n] do
                list3[j]:=List(list1[j], x->((x+1)^p)-1); 
            od;
            list3:=SSortedList(list3);
            if list3=list2 then
                return true;
            fi;
        od;
    od;
    
    return false;
end;



transitiveGsetCongruences:=function(args)
    # transitiveGsetCongruences:=function([n, minsize, maxsize, abelian, solvable, core])
    # Find all congruence lattices of transitive G-sets in Eq(n).
    #
    # Inputs: n           search among transitive groups of degree n.
    #         minsize     ignore intervals with less than minsize elements.
    #         maxsize     ignore intervals with more than maxsize elements.
    #         abelian     (optional,default=1) if 0, don't include abelian groups in the search. 
    #         solvable    (optional,default=1) if 0, don't include solvable groups in the search.
    #         core    (optional,default=0) if 1, include intervals [H,G] even if H is not core-free. 
    #
    # Author: William DeMeo <williamdemeo@gmail.com>
    # Date: 2011.03.06
    #
    local i, t, m, numtrans, pathname, g, h, lats, datfile, filename, outfile, prefix, intsubs, 
          latsize, incls, obtained, newcnt, indx, core, e, nargin, n, abelian, solvable, minsize, maxsize;
    
    nargin := Length(args);
    
    if nargin < 6 then core:=0; else core:=args[6]; fi;
    if nargin < 5 then solvable:=1; else solvable:=args[5]; fi;
    if nargin < 4 then abelian:=1; else abelian:=args[4]; fi;
    if nargin < 3 then maxsize:=10; else maxsize:=args[3]; fi;
    if nargin < 2 then minsize:=3; else minsize:=args[2]; fi;
    if nargin < 1 then 
        Error("usage: transitiveGsetCongruences([n, minsize, maxsize, ...]);");
    else n:=args[1];
    fi;
    
    pathname := "~/pub/research/LatticeTheory/DeMeo/GAP/outputs/";
    prefix := "TransitiveGsetCongEx";
    prefix := Concatenation(prefix, String(n));
    if abelian=0 then prefix := Concatenation(prefix, "NonAbelian"); fi;
    if solvable=0 then prefix := Concatenation(prefix, "NonSolvable"); fi;
    if core=0 then prefix := Concatenation(prefix, "Corefree"); fi;
    
    # This one stores output in human readable format:
    filename := Concatenation(pathname, prefix, "Min", String(minsize), "Max", String(maxsize), ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    # This one stores output in format that will be read in by BatchCovers2Hasse.m Matlab routine:
    datfile := Concatenation(pathname, prefix, "Min", String(minsize), "Max", String(maxsize), ".dat");
    datfile := OutputTextFile(datfile, false);
    SetPrintFormattingStatus(datfile, false);   # This prevents automatic indentation and line breaks.
    
    lats :=  [[[]]] ;  # stores lattices we have found 
    # lats[j] is a list of lists of lists e.g.
    # lats[5] = [ [ [0,1],[0,2],[1,3],[2,4],[3,4] ], [ [0,1],[0,2],[0,3],[1,4],[2,4],[3,4] ] ]
    # indicates that we have found two 5-element lattices (N5 and M3).
    newcnt:=0;
    
    numtrans:=NrTransitiveGroups(n);
    Print("Checking the ", numtrans, " transitive group(s) of order |G| = ", n, "...  (", newcnt, " intervals so far) \n");
    newcnt:=0;
    for i in [1..numtrans] do
        Print("Checking ", i, "/", numtrans, "...  (", newcnt, " intervals so far) \n");
        g:=TransitiveGroup(n,i);
        if abelian=0 and IsAbelian(g) then
            # do nothing
        elif solvable=0 and IsSolvable(g) then
            # do nothing
        else
            e := Group([Identity(g)]);
            h:=Stabilizer(g,1);

            if core=0 and h<>e and IsNormal(g,h) then
                # do nothing (first test for normality of H since it's faster 
                #             than checking for core-freeness; there are smarter 
                #             ways to check this--see Alpha & Beta versions below) 
            elif core=0 and Core(g,h)<>e then
                # do nothing
            else

                intsubs:=IntermediateSubgroups(g,h);
                latsize := Size(intsubs.subgroups)+2;
                obtained:=0;   # indicator (have we seen this lattice already?)
                
                if minsize <= latsize and latsize <= maxsize then
                    incls := SSortedList(intsubs.inclusions);
                        
                    if IsBound(lats[latsize]) then
                            
                        # check if [h, g] is isomorphic to something we've already seen
                        if incls in lats[latsize] then
                            # do nothing
                            obtained := 1;
                        else
                            Print("Checking whether L is isomorphic to one we've seen... (|L| = ", latsize, ")");
                            for m in [1..Size(lats[latsize])] do
                                if lats[latsize][m] = incls then
                                    obtained := 1;
                                    break;
                                fi;
                            od;
                            t:=1;
                            while obtained=0 and t <= Size(lats[latsize]) do
                                if isIsomorphicIntervalQuick(lats[latsize][t], incls) then
                                    obtained := 1;
                                fi;
                                t:=t+1;
                            od;
                            Print(" ...done.\n");
                            
                        fi;
                        
                        if obtained=0 then
                            # add this lattice to the list of representable lattices
                            Add(lats[latsize], incls);
                            newcnt:=newcnt+1;
                        fi;
                    else # we haven't seen a lattice of order latsize before, so record this
                        # one as the first in the list of rep'le lattices of order latsize.
                        lats[latsize]:=[incls];
                        newcnt:=newcnt+1;
                    fi;
                    
                    if obtained=0 then
                        indx:=Index(g,h);
                        AppendTo(outfile, "\n", newcnt, ".(", latsize, ")  G = TransitiveGroup(", n, ", ", i, ") = ", StructureDescription(g)); 
                        AppendTo(outfile, "   Index: ", indx, "\n"); 
                        AppendTo(outfile, "       [", StructureDescription(h),", G] = ",  incls, "\n"); 
                        AppendTo(datfile, incls,";[", StructureDescription(h),", ", StructureDescription(g), "];");
                        AppendTo(datfile, "TransitiveGroup(", n, ",", i, ") \n");
                    fi;
                fi;
            fi;
        fi;
    od;
end;
