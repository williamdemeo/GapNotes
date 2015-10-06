# Gap function for testing a conjecture of Ed Bertram.
#
# Author: William DeMeo <williamdemeo@gmail.com>
# Date: 2010.07.27
# Updated: 2010.08.01

testConjecture:=function(G, g, name, verbose)
    # INPUTS
    # G     The group
    #
    # g     Another copy of the group
    #       Unfortunately, it's not clear to me how to get a copy of, 
    #       say, the conjugacy classes, which saves their original names.  
    #       So, until I figure this out, you have to pass two distinct copies, 
    #       G and g, of the same group to this function.
    #
    # name  The name of the group (used in output file name)
    #
    # verbose  if verbose=false, no extra info is printed to outfile
    #          if verbose=true, extra info is printed to outfile
    #
    # OUTPUTS
    # name.out  A file with the results ( <-- fix this: describe the resulting file )
    #
    # EXAMPLE
    #       gap> Read("testConjecture.g");
    #       gap> s4 := SymmetricGroup(4);; S4 := SymmetricGroup(4);;
    #       gap> name := "S4";;
    #       gap> testConjecture(S4, s4, name, true);  # for verbose output
    #       gap> testConjecture(S4, s4, name, false); # for terse output
    #
    # WARNING: This program will overwrite any file named "name.out", if such a file
    #          already exists in the directory called pathname (defined below)
    
    local i, j, k, cc, numcc, ccRenamed, mscr, nummscr, mscrRenamed, alphabet, Alphabet, 
          pathname, filename, outfile, intersectList, unionMaxjs, unionNNMaxjs, numcci, 
          nummscri, indx, numconj;
    
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/sessions/";
    outfile := Concatenation(pathname, name, ".out");
    
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/", name, ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    PrintTo(outfile, "The Group G = ", StructureDescription(G), "\n");
    
    alphabet := "abcdefghijklmnopqrstuvwxyz";
    Alphabet := "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    # CONJUGACY CLASSES
    cc := ConjugacyClasses(G);
    ccRenamed := ConjugacyClasses(g);
    numcc := Size(ccRenamed);
    
    if verbose then
        AppendTo(outfile, "\nConjugacy Classes: \n");
    fi;
    for i in [1..numcc] do
        SetName(ccRenamed[i],WordAlp(alphabet, i));
        if verbose then
            AppendTo(outfile, ccRenamed[i], " = ", cc[i], "  Size of class = ", Size(cc[i]), "\n");
        fi;
    od;
    
    # CONJUGACY CLASSES OF MAXIMAL SUBGROUP     
    if verbose then
        AppendTo(outfile, "\nMaximal Subgroup Class Representatives:\n");
    fi;
    mscr := MaximalSubgroupClassReps(G);
    mscrRenamed := MaximalSubgroupClassReps(g);
    nummscr := Size(mscrRenamed);
    
    for j in [1..nummscr] do
        SetName(mscrRenamed[j],WordAlp(Alphabet, j));
        if verbose then
            indx := Index(G, mscr[j]);
            numconj := Size(ConjugateSubgroups(G, mscr[j]));
            Test to see if indx is equal numconj
            if indx <> numconj then
              Print("\nError: failed test [G : M] == number of conjugates of M\n");
              Print("Error: M = ", mscr[j], " and [G : M] = ", indx, " is not equal ", 
                    numconj, ", the number of conjugates of M\n");
            fi;
            AppendTo(outfile, mscrRenamed[j], " = ", mscr[j], "  Size of class = ", numconj, "\n");
        fi;
    od;
    
    AppendTo(outfile, "\n");
    
    # ...and, finally, we get to the actual test for intersection:
    intersectList := [[]];
    for i in [1..nummscr] do
        if IsNormal(G, mscr[i]) then
            AppendTo(outfile, "*");   # mark normal maximal subgroups with an asterix
        else
            AppendTo(outfile, " ");
        fi;
        AppendTo(outfile, mscrRenamed[i], ": ");
        
        # For each conjugacy class, cc[j], 
        # test whether the maximal subgroup mscr[i] intersects cc[j].
        intersectList[i] := [];
        for j in [1..numcc] do
            if IsEmpty(Intersection(Elements(mscr[i]), Elements(cc[j]))) then
                # do nothing          
            else  
                # mscr[i] intersects cc[j], so add ccRenamed[j] to the n
                # conjugacy class list for ith max subgroup, intersectList[i].
                intersectList[i] := Concatenation(intersectList[i], Elements(cc[j]));
                AppendTo(outfile, ccRenamed[j], ", ");
            fi;
        od;
        AppendTo(outfile, "\n");
    od;
    
    # now test the conjecture:
    AppendTo(outfile, "\n    | subset of all others | subset of non-normals |\n");
    for i in [1..nummscr] do
        if IsNormal(G, mscr[i]) then
            AppendTo(outfile, "*");   # mark normal maximal subgroups with an asterix
        else
            AppendTo(outfile, " ");
        fi;
        AppendTo(outfile, mscrRenamed[i], "  | ");
        
        unionMaxjs := [ ];   # union of cc's intersecting all other (not i) max subgroup reps
        unionNNMaxjs := [ ]; # union of cc's intersecting all other (not i) non-normal max 
                             # subgroup reps

        for j in [1..nummscr] do
            if j = i then
                # do nothing
            else
                unionMaxjs := Union(unionMaxjs, intersectList[j]);
                if IsNormal(G, mscr[j]) then
                    # do nothing
                else 
                    unionNNMaxjs := Union(unionNNMaxjs, intersectList[j]);
                fi;
            fi;
        od;
        
        # test whether intersectList[i] is contained in unionMaxjs and unionNNMaxjs:
        if IsSubset(unionMaxjs, intersectList[i]) then
            AppendTo(outfile, "       YES           | ");
        else 
            AppendTo(outfile, "       no            | ");
        fi;
        if IsSubset(unionNNMaxjs, intersectList[i]) then
            AppendTo(outfile, "       YES            |\n");
        else 
            AppendTo(outfile, "       no             |\n");
        fi;
    od;
            
end;;