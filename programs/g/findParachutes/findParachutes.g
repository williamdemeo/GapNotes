# File: findParchutes.g
# Author: William DeMeo
# Date: 2012.09.30
#
# Description: A collection of GAP routines for parachute lattices as upper intervals in subgroup lattices.
#
# Notes: This should work on any GAP installation that includes the Small Groups library.
#
#        ATTENTION!  YOU MUST EDIT THE VARIABLE pathname 
#                    which appears in the very first function, getPathName, below.
#
# Send questions, comments, suggestions to williamdemeo@gmail.com
#

getPathName := function()    
# Get the path where output files will be stored.
    local pathname;
    if ARCH_IS_WINDOWS() then
        pathname := "H:\\Dropbox\\GAP\\outputs\\";   # <<<<<<<< ATTENTION!  YOU MUST EDIT THIS VARIABLE
        if IsDirectoryPath(pathname) then
            Print("Output directory: ", pathname, "\n");
        else
            Print("Warning: output directory: ", pathname, " is unavailable... \n");
            pathname := "C:\\Documents and Settings\\williamdemeo\\My Documents\\Dropbox\\GAP\\outputs\\";
              if IsDirectoryPath(pathname) then
                Print("       ...using instead: ", pathname, "\n");
            else
                Print("Warning: output directory: ", pathname, " is unavailable... \n");
            fi;
        fi;
    else
        pathname := "/home/williamdemeo/pub/research/LatticeTheory/DeMeo/GAP/outputs/";
        if IsDirectoryPath(pathname) then
            Print("Output directory: ", pathname, "\n");
        else
            Print("Warning: output directory: ", pathname, " is unavailable... \n");
        fi;
    fi;
    return pathname;
end;


getSystemDate := function()    
# Get the system date.  (based on example in GAP manual, page 108)
    local path, date, str, a;
    path := DirectoriesSystemPrograms();;
    date := Filename( path, "date" );  # e.g. "/bin/date"
    # Now execute date with no argument and no input, collect the output into a string stream.
    str := "";; a := OutputTextString(str,true);;
    Process( DirectoryCurrent(), date, InputTextNone(), a, [] );
    CloseStream(a);
    return str;    # e.g. Fri Jul 11 09:04:23 MET DST 1997
end;

timeStamp := function()
# get a date/time string (in a format suitable for appending to filenames)
    local date, dd, time, hhmm, t;
    date:=getSystemDate();
    dd:= SplitString(date, " ");  # e.g. [ "Sat", "May", "14", "20:50:55", "HST", "2011\n" ]
    if Length(dd)=6 then
        t:=4;
    elif Length(dd)=7 then
        t:=5;
    else
        Error("timeStamp: unexpected output from getSystemDate()");
    fi;
    time:=dd[t];
    hhmm:=SplitString(time, ":");
    date:=Concatenation(dd[t-1], dd[2], hhmm[1], ":", hhmm[2]);
    return date;
end;


# The following function was suggested by Laurent Bartholdi (and communicated to the GAP 
# forum by A. Hulpke) for the purpose of trying a particular GAP function, f, for maxtime; 
# if an answer is not found in less than maxtime, fail is returned.  This is useful for me
# because I think the StructureDescription commands in my findUpperIntervals routine are
# sometimes easy, but sometimes essentially killing the program.
# 
# UnderTimeControl := function(f,args,maxtime)
#   local pipe, pid, result;
#   pipe := IO_pipe();
#   pid := IO_fork();
#   if pid=0 then
#       pipe := IO_WrapFD(pipe.towrite,false,false);
#       IO_Pickle(pipe,CallFuncList(f,args));
#       IO_Close(pipe);
#       IO_kill(IO_getpid(),9);
#   fi;
#   pipe := IO_WrapFD(pipe.toread,false,false);
#   result := IO_Select([pipe],[],[],[],QuoInt(maxtime,1000000),RemInt(maxtime,1000000));
#   if result=fail or result=0 then
#       IO_kill(pid,9);
#       return fail;
#   fi;
#   result := IO_Unpickle(pipe);
#   IO_Close(pipe);
#   return result;
# end;



IsCorefree := function(args)
    # IsCorefree := function([G,H,cores])
    # For the given groups 1 < H < G, test whether H is core-free in G.
    # (i.e. test whether H contains no nontrivial normal subgroup of G).
    #
    # Inputs:  G      a group
    #          H      a subgroup of G
    #          cores  (optional) list of cores or minimal normal subgroups of G
    #
    # Outputs: corefree   =true if H is corefree, =false otherwise
    #          cores      the (augmented) list of normal subgroups of G
    #
    # author: williamdemeo@gmail.com
    # updated: 2011.05.14
    #
    local nargin, G, H, N, cores, corefree, method, coreH;
    corefree:=true;  # start by assuming it's core-free
    nargin := Length(args);
    if nargin < 3 then cores:=[]; else cores:=args[3]; fi;
    if nargin < 2 then Error("usage: IsCorefree([G, H, ...]);"); fi;
    G:=args[1];  H:=args[2];
    if Order(H) = 1 then Error("usage: IsCorefree([G, H, ...]); with H a NONTRIVIAL subgroup of G"); fi;
    # The list cores can contain any known normal subgroups of G, in which case the following 
    # bit of code may help us to more quickly detect a non-corefree subgroup:
    if IsBound(cores) then
        for N in cores do
            if IsSubgroup(H,N) then
                corefree:=false;
                break;
            fi;
        od;
    fi;
    # If the foregoing quick test didn't find a normal subgroup 
    # of G inside H, we then check the core of H more carefully.
    if corefree=true then
        if IsNormal(G,H) then
            # checking normality should be faster than computing the core exactly
            corefree:=false;  
            if IsBound(cores) then Add(cores,H);
            else cores:=[H]; fi;
            # but if that doesn't do it, we finally use GAP's Core function:
        else        
            coreH := Core(G,H);
            if Order(coreH)>1 then
                corefree:=false;
                if IsBound(cores) then Add(cores,coreH);
                else cores:=[coreH]; fi;
            fi;
        fi;
    fi;
    return [corefree, cores];
end;


isIsomorphicInterval:=function(list1, list2)
    # Test whether two sets of covering relations are the same modulo relabelling. 
    # This routine works, and accurately identifies matches, but is very slow and/or
    # causes an out-of-memory error when the maximum number in the list of covering 
    # relations is 11 or higher.
    local n, m, j, list3, G, p;
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
    for p in Elements(G) do
        list3 := [[ ]];
        for j in [1..n] do
            list3[j]:=List(list1[j], x->((x+1)^p)-1); 
        od;
        list3:=SSortedList(list3);
        if list3=list2 then
            return true;
        fi;
    od;
    return false;
end;

findParachutes:=function(args)
    # findParachutes:=function([n1, n2, minsz, maxsz, abelian, solvable, pgroup, core, norepeats, VERBOSE])
    # Search among PRIMITIVE groups G with n1 <= degree(G) <=n2, and output all (isomorphism classes of) 
    # parachute lattice intervals L=[H,G] with minsz <= |L| <= maxsz.
    #
    # Inputs: n1,n2       search among primitive groups G with n1 <= degree(G) <= n2.
    #         minsz       ignore intervals with less than minsz elements
    #         maxsz       ignore intervals with more than maxsz elements
    #         abelian     (optional,default=0)  if 1, include abelian groups in the search. 
    #         solvable    (optional,default=0)  if 1, include solvable groups in the search.
    #         pgroup      (optional,default=0)  if 1, include p-groups in the search.
    #         core        (optional,default=0)  if 1, include intervals [H,G] even when H is not core-free. 
    #         norepeats   (optional,default=0) if 1, record only the first time a given interval appears (not programmed yet)
    #                                           if 0, record a given interval at most one time per group.
    #         VERBOSE     (optional,default=0)  if >0, print index of all subgroups in intervals with <10 elements.
    #                                           if >1, print struc descr all subgroups in intervals with <10 elements.
    #
    # Output: file        The output file is called something like findParachutesMinAtoB.out where A=n1, B=n2.
    #                     (Other strings may be added to the file name depending on what arguments are used
    #                     when the function is called.)  The file stores the (non-isomorphic) parachute
    #                     lattices L=[H,G] with minsz <= |L| <= maxsz among primitive groups with n1 <= degree(G) <=n2. 
    #
    # Example: findParachutes( [ 3, 255, 4, 10, 1, 1, 0, 1 ] );
    #          # finds all parachutes [H, G] in Sub[G] for primitive group G with 
    #          # 2 < degree(G) < 256 such that H is core free and such that the 
    #          # interval [H, G] contains at least 4 and at most 10 elements.
    #
    # Author: <williamdemeo@gmail.com>
    # updated: 2012.09.30
    #
    local i, j, k, m, r, s, pathname, filename, datfile, outfile, logfile, newcnt, maxsize, 
          ncfcnt, G, e, numpg, perm, t, prefix, ignore, answer,
          pgroup, strucG, strucH, n1, n2, minsz, maxsz, abelian, solvable, core, nargin, norepeats, 
          BETA, VERBOSE, complements, TG;
    #(G,core,minsz,maxsz,newcnt,ncfcnt);
    #answer:=[];
    
    BETA:=false;  # set this to false when we're done with unit testing
    
    nargin := Length(args);
    if nargin < 10 then VERBOSE:=0; else VERBOSE:=args[10]; fi;
    if nargin < 9 then norepeats:=0; else norepeats:=args[9]; fi;
    if nargin < 8 then core:=0; else core:=args[8]; fi;
    if nargin < 7 then pgroup:=0; else pgroup:=args[7]; fi;
    if nargin < 6 then solvable:=0; else solvable:=args[6]; fi;
    if nargin < 5 then abelian:=0; else abelian:=args[5]; fi;
    if nargin < 4 then Error("usage: findParachutes([n1, n2, minsize, maxsize, ...]);");  fi;
    
    TG:=" primitive ";

    if solvable=0 and abelian<>0 then
        Error("Abelian groups are solvable... but you asked to include abelian groups and exclude solvable groups...??");
    fi;
    
    n1:=args[1];  n2:=args[2];  minsz:=args[3];  maxsz:=args[4];
        
    newcnt:=0;  maxsize:=0; ncfcnt:=0;
    
    prefix := "findParachutes";
    if solvable=1 then prefix := Concatenation(prefix, "Solv"); fi;
    if abelian=1 then prefix := Concatenation(prefix, "Abel"); fi;
    if core=1 then prefix := Concatenation(prefix, "Core"); fi;
    prefix:=Concatenation(prefix, String(n1), "to", String(n2), "Min", String(minsz), "Max", String(maxsz));
    
    pathname := getPathName();
    prefix:=Concatenation(pathname, prefix);
    if not ARCH_IS_WINDOWS() then
        prefix:= Concatenation(prefix, "-", timeStamp());
    fi;
    
    # This one stores output in human readable format:
    filename := Concatenation(prefix, ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    # This one stores output in format that will be read in by BatchCovers2Hasse.m Matlab routine:
    filename := Concatenation(prefix, ".dat");
    datfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(datfile, false);   # This prevents automatic indentation and line breaks.
    
    filename := Concatenation(prefix, ".log");
    logfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(logfile, false);   # This prevents automatic indentation and line breaks.
    
    if not ARCH_IS_WINDOWS() then
        PrintTo(outfile, "This output file was created on ", getSystemDate(), "\n by ");
        PrintTo(logfile, "This log file was created on ", getSystemDate(), "\n by ");
    fi;
    PrintTo(outfile, "GAP function call:  findParachutes( ", args, " ); \n\n");
    PrintTo(logfile, "GAP function call:  findParachutes( ", args, " ); \n\n");
    
    for i in [n1..n2] do
        
        numpg:=NrPrimitiveGroups(i);
        
        Print("Checking the ", numpg, TG, "group(s) of degree ", i, "...  (so far ", newcnt, " intervals, ", ncfcnt, " non-corefree) \nP(", i, ",j): ");
        PrintTo(outfile, "\nP(", i, ",j): ");
        AppendTo(logfile, "Checking the ",numpg,TG,"group(s) of degree ",i,"...  (so far ", newcnt, " intervals, ", ncfcnt," non-corefree) \nP(",i, ",j): ");
        for j in [1..numpg] do
            Print(j, ", ");
            PrintTo(outfile, j, ", ");
            PrintTo(logfile, j, ", ");
            G := PrimitiveGroup(i,j);
            
            # Step 1: check if we want to include this group in the search.
            ignore:=false;   # Begin by assuming we don't want to ignore this group.
            
            # p-groups
            if pgroup=0 then 
                #Print("Checking if it's a p-group.\n");
                if IsPGroup(G) then 
                    ignore:=true;
                fi;
            elif pgroup=-1 then
                #Print("Checking if it's a p-group.\n");
                if not IsPGroup(G) then 
                    ignore:=true;
                fi;
            fi;
            
            # abelian groups
            if not ignore then
                if abelian=0 then
                    #Print("Checking if it's abelian.\n");
                    if IsAbelian(G) then 
                        ignore:=true; 
                    fi;
                elif abelian=-1 then
                    #Print("Checking if it's abelian.\n");
                    if not IsAbelian(G) then 
                        ignore:=true; 
                    fi;
                fi;
            fi;
            
            # solvable groups
            if not ignore then
                if solvable=0 then
                    #Print("Checking if it's solvable.\n");
                    if IsSolvable(G) then
                        ignore:=true;
                    fi;
                elif solvable=-1 then
                    #Print("Checking if it's solvable.\n");
                    if not IsSolvable(G) then
                        ignore:=true;
                    fi;
                fi;
            fi;
            
            if not ignore then
                answer:=findParachutesInG([G,core,minsz,maxsz,newcnt,ncfcnt,outfile,datfile]);
                newcnt:=answer[1];
                ncfcnt:=answer[2];
            fi;
        od;
    od;
end;;            

findParachutesInG:=function(args)
#  findParachutesInG([G,core,minsz,maxsz,newcnt,ncfcnt,outfile,datfile]);
    local k, kk, jj, first, indx, e, cc, numcc, numpg, lats, latsize, obtained, intSubs, H, perm, t, prefix, ignore, answer, 
          pgroup, strucG, strucH, n1, n2, abelian, solvable, cores, corefree, nargin, Atoms, incls,
          BETA, VERBOSE, complements, TG, filename,
          G,core,minsz,maxsz,newcnt,ncfcnt,outfile,datfile;
    
    nargin := Length(args);
    
    if nargin < 8 then
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
        outfile:=args[7]; datfile:=args[8];
    fi;    
    if nargin<6 then newcnt:=0; ncfcnt:=0;  else newcnt:=args[5]; ncfcnt:=args[6]; fi;
    if nargin<4 then minsz:=6;  maxsz:=40; else minsz:=args[3];  maxsz:=args[4]; fi;
    if nargin < 2 then core:=0; else core:=args[2]; fi;
    if nargin < 1 then Error("usage: findParachutesInG([G, ...]);");  else G:=args[1]; fi;
    
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
    
# The following two functions were suggested on the GAP forum
# by Bettina Eick <beick@tu-bs.de >, as a means of 
# collecting the minimal normal subgroups of a group.
AddToSubgroupList := function( nt, U )
local i, N;
    # check if U is minimal in nt
    for N in nt do if IsSubgroup(U, N) then return nt; fi; od;
    
    # check that nt remains minimal
    for i in [1..Length(nt)] do
        if IsSubgroup(nt[i], U) then nt[i] := false; fi;
    od;
    nt := Filtered( nt, x -> not IsBool(x) );

    # add U and return
    Add(nt, U); return nt;
end;

minimalNormalSubgroups := function(G)
    local cl, nt, c, U;
    cl := ConjugacyClasses(G);
    nt := [];
    for c in cl do
        if IsPrime(Order(Representative(c))) then
            U  := Subgroup( G, [Representative(c)] );
            U  := NormalClosure( G, U );
            nt := AddToSubgroupList( nt, U );
        fi;
    od;
    return nt;
end;



printUpperIntervalsInG:=function(args)
    # printUpperIntervalsInG:=function([G, datfile, i, j, TYPE, minL, maxL])
    # Find upper intervals, with at least (most) minL (maxL) elements, above second maximal subgroups of G.
    # 
    local K, H, ms, msK, h, i, j, k, intHG, numms, nameG, pathname, filename, G,
          outfile, nargin, verbose, latsize, core, corefree, coreH, prim, TYPE,
          minL, maxL;
    verbose:=0; core:=0;
    G:=args[1];
    nargin := Length(args);
    if nargin < 7 then maxL:=0; else maxL:=args[7]; fi;
    if nargin < 6 then minL:=0; else minL:=args[6]; fi;
    if nargin < 5 then TYPE:="Small"; else TYPE:=args[5]; fi;  # the default is to print "SmallGroups(i,j)". If prim=1, print PrimitiveGroup(i,j).
    if nargin < 4 then j:=0; else j:=args[4]; fi;
    if nargin < 3 then i:=0; else i:=args[3]; fi;
    if nargin < 2 then 
        verbose:=1;
        nameG:=StructureDescription(G);
        pathname := getPathName();
        filename:=Concatenation(pathname, "SecondMaximalUpperIntervalsIn", nameG, ".dat");
        outfile := OutputTextFile(filename, false);
        SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
        PrintTo(outfile, "Command used: PrintUpperIntervalsInG( ", args, " ); \n\n");
    else
        outfile:=args[2];
    fi;
    ms:=MaximalSubgroupClassReps(G);
    numms:=Size(ms);
    if verbose=1 then
        Print("\n==== Checking the ", numms, " maximal subgroups of ", nameG, " ====\n");
#        AppendTo(outfile,"\n==== Checking the ", numms, " maximal subgroups of ", nameG, " ====\n");
    fi;
    
    for k in [1..numms] do
        msK:=MaximalSubgroupClassReps(ms[k]);
        if verbose=1 then
            Print("\n--- Checking the ", Size(msK), " second maximal subgroups below maximal subgroup ", k, " (of ", numms, " max subgps in ", nameG, ") ---\n");
#            AppendTo(outfile,"\n--- Checking the ", Size(msK), " second maximal subgroups below maximal subgroup ", k, " (of ", numms, " max subgps in ", nameG, ") ---\n");
        fi;
        for h in [1..Size(msK)] do
            H:=msK[h];
            corefree:=true;
            if core=0 and Order(H)>1 then   
                # check whether H is core-free
                if IsNormal(G,H) then
                    corefree:=false;
                else
                    coreH := Core(G,H);
                    if Order(coreH)>1 then
                        corefree:=false;
                    fi;
                fi;
            fi;
            if corefree then
                intHG:=IntermediateSubgroups(G,msK[h]);
                latsize:=Size(intHG.subgroups)+2;
                if verbose=1 then
                    Print("(",k,",",h,")\n          ", latsize, " = |L|;    intHG = ", intHG.inclusions, "\n");
                    AppendTo(outfile, intHG.inclusions, "; (", latsize, ") ", StructureDescription(G), " (",k,",",h,")  Index: ", Index(G,H), "; \n");
                elif latsize>=minL and latsize<=maxL then
                    if latsize=7 then
                        #                        Print("G = ", StructureDescription(G), "   H = ", StructureDescription(H), "  |G| = ", Order(G), "  |H| = ", Order(H), "\n");
                        Print("G = ", G, "   H = ", StructureDescription(H), "  |G| = ", Order(G), "  |H| = ", Order(H), "\n");
                        Print(">>>>>> ", latsize, ". ", TYPE, "Group(",i,",",j,"): (",k,",",h,") ", intHG.inclusions, " <<<<<<<<<<\n");
                    else
                    Print("G = ", G, "   H = ", StructureDescription(H), "  |G| = ", Order(G), "  |H| = ", Order(H), "\n");
                    # Print("G = ", StructureDescription(G), "   H = ", StructureDescription(H), "  |G| = ", Order(G), "  |H| = ", Order(H), "\n");
                    Print("  ", latsize, ". ", TYPE, "Group(",i,",",j,"): (",k,",",h,") ", intHG.inclusions, "\n");
                    fi;
                    AppendTo(outfile,  intHG.inclusions, ";  (", latsize, ") ", TYPE, "Group(",i,",",j,");  (",k,",",h,") Index:", Index(G,H),"\n");
                fi;
            fi;
        od;
    od;
end;

printUpperIntervalsInG2:=function(args)
    # printUpperIntervalsInG2:=function([G, datfile, i, j, core])
    # Find upper intervals, with at least 7 elements, above third maximal subgroups and below second maximal subgroups of G.
    # If core=1, allow the second maximal subgroups to contain a non-trivial normal subgroup of G.
    # If G is Alt(n) or Sym(n), set core=1, so as to not waste time looking for normal subgroups.
    local K, H, J, ms, msK, msH, h, i, j, k, l, intJK, numms, nameG, pathname, filename, G, outfile, nargin, verbose, latsize, core, corefree, coreJ;
    verbose:=0;
    G:=args[1];
    nargin := Length(args);
    if nargin < 5 then core:=0; else core:=args[5]; fi;  # the default is to allow H to have non-trivial core
    if nargin < 4 then j:=0; else j:=args[4]; fi;
    if nargin < 3 then i:=0; else i:=args[3]; fi;
    if nargin < 2 then 
        verbose:=1;
        nameG:=StructureDescription(G);
        pathname := getPathName();
        filename:=Concatenation(pathname, "ThirdMaxlUpperIntsInMaxSubsOf", nameG);
        if core=1 then filename:=Concatenation(filename, "WithCores"); fi;
        filename:=Concatenation(filename, ".dat");
        outfile := OutputTextFile(filename, false);
        SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
        PrintTo(outfile, "Command used: PrintUpperIntervalsInG2( ", args, " ); \n\n");
    else
        outfile:=args[2];
    fi;
    ms:=MaximalSubgroupClassReps(G);
    numms:=Size(ms);
    if verbose=1 then
        Print("\n==== Checking the ", numms, " maximal subgroups of ", nameG, " ====\n");
#        AppendTo(outfile,"\n==== Checking the ", numms, " maximal subgroups of ", nameG, " ====\n");
    fi;
    
    for k in [1..numms] do
        K:=ms[k];
        msK:=MaximalSubgroupClassReps(K);
        if verbose=1 then
            Print("\n--- Checking the ", Size(msK), " second maximal subgroups below maximal subgroup ", k, " (of ", numms, " max subgps in ", nameG, ") ---\n");
        fi;
        for h in [1..Size(msK)] do
            H:=msK[h];
            msH:=MaximalSubgroupClassReps(H);
            if verbose=1 then
                Print("\n--- Checking the ", Size(msH), " third maximal subgroups below second maximal subgroup ", h, " (of ", Size(msK), " second max subgps in ", nameG, ") ---\n");
            fi;
            for j in [1..Size(msH)] do
                J:=msH[j];
                corefree:=true;
                if core=0 and Order(J)>1 then   
                    # check whether J is core-free in K
                    if IsNormal(K,J) then
                        corefree:=false;
                    else
                        coreJ := Core(K,J);
                        if Order(coreJ)>1 then
                            corefree:=false;
                        fi;
                    fi;
                fi;
                if corefree then
                    intJK:=IntermediateSubgroups(K,J);
                    latsize:=Size(intJK.subgroups)+2;
                    if verbose=1 then
                        # Print("(",k,",",h,",",j,")\n          ", latsize, " = |L|;    intJK = ", intJK.inclusions, "\n");
                        Print("(", latsize, ") ", intJK.inclusions, " G=", StructureDescription(G), "  (",k,",",h,",",j,"); ",
                                " K=", StructureDescription(K), ", J=", StructureDescription(J), ", [K:J]=", Index(K,J), "\n");
                        AppendTo(outfile, intJK.inclusions, "; (", latsize, ") G=", StructureDescription(G), "  (",k,",",h,",",j,"); ",
                                " K=", StructureDescription(K), ", J=", StructureDescription(J), ", [K:J]=", Index(K,J), "\n");
                    # elif latsize>6 then
                    #     Print("G = ", StructureDescription(G), "   H = ", StructureDescription(H), "  corefree = ", corefree, "\n");
                    #     Print(latsize, ". SmallGroup(",i,",",j,"): (",k,",",h,") ", intHG.inclusions, "\n");
                    #     AppendTo(outfile,  intHG.inclusions, ";  (", latsize, ") SmallGroup(",i,",",j,");  (",k,",",h,") Index:", Index(G,H),"\n");
                    fi;
                fi;
            od;
        od;
    od;
end;

                  
    
findUpperIntervalsInPrimitiveGroups:=function(args)
    # findUpperIntervalsInPrimitiveGroups([n1, n2, NonSolvable, AOSType]);
    local i,j,k, m, r, s, pathname, filename, datfile, outfile, incls, newcnt, grps, AOSType, numprim,
          G, e, numsg, t, corefree, n1, n2, abelian, solvable, core, nargin, prefix, NonSolvable;
    nargin := Length(args);
    prefix := "SecondMaximalUpperIntInPrimitive";
    n1:=args[1];  n2:=args[2];
    
    core:=1;  # not using this now
    
    if nargin < 4 then  AOSType:=0; else AOSType:=args[4]; fi;
    if nargin < 3 then NonSolvable:=0; else NonSolvable:=args[3]; fi;
    if NonSolvable>0 then
        prefix:=Concatenation(prefix, "NonSolvable");
    fi;
    if AOSType>0 then
        prefix:=Concatenation(prefix, "ONanScottType", String(AOSType));
    fi;
    newcnt:=0;
    
    prefix:=Concatenation(prefix, String(n1), "to", String(n2));
    
    pathname := getPathName();
    # This one stores output in human readable format:
    filename := Concatenation(pathname, prefix, ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    PrintTo(outfile, "Command used: findUpperIntervalsInPrimitiveNonsolvableGroups( ", args, " ); \n\n");
    
    # This one stores output in human readable format:
    filename := Concatenation(pathname, prefix, ".dat");
    datfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(datfile, false);   # This prevents automatic indentation and line breaks.
    PrintTo(datfile, "Command used: findUpperIntervalsInPrimitiveNonsolvableGroups( ", args, " ); \n\n");
    
    for i in [n1..n2] do
        Print("Checking the ", NrPrimitiveGroups(i), " primitive group(s) of degree ", i, "...\n");
        numprim:=NrPrimitiveGroups(i);
        for j in [1..numprim] do
            G:=PrimitiveGroup(i,j);
            if AOSType=0 or ONanScottType(G)=String(AOSType) then
                if NonSolvable=1 and IsSolvable(G) then
                        # do nothing
                else
                    printUpperIntervalsInG([G,datfile,i,j,core,"Primitive"]);
                fi;
            fi;
        od;
    od;

end;;
    






canonicalForm:=function(incl)
    # Put covering relations in "canonical" form.
    # This routine does NOT work well.  It sometimes leaves the coverings arranged
    # so that the maximum number does not appear in the last covering relation.
    # DEBUG: figure out a better canonical form and improve this routine.
    local n, m, j, i, x, y, z, newincl, f, count, flag, p, tmp;
    if not IsList(incl) then
        Error("usage: canonicalForm( <list> );");
    fi;
    incl := SSortedList(incl);
    n:=Length(incl);
    m:=Maximum(Maximum(incl));
    count:=0;
    i:=2;
    while i<n-1 do
        if incl[i][2] > incl[i+1][2] then
            flag:=1;
            if incl[i][1] <> incl[i+1][1] then
                p:=Positions(List([1..n], x->incl[x][1]), incl[i][1]);
                if incl[i+1][2] in List(p, x->incl[x][2]) then
                    flag:=0;  # don't need to permute elements since
                fi;           # incl[i][2] > incl[i+1][2] is necessary since the
                              # covering [incl[i][1] incl[i+1][2]] already appeared.
            fi;
            if flag=1 then
                y:=incl[i][2];   z:=incl[i+1][2];
                # swap y and z values
                f:=[1..m+1]; f[y+1]:=z+1; f[z+1]:=y+1;
                newincl:=[[ ]];
                for j in [1..n] do
                    newincl[j]:=List(incl[j], x->(f[x+1]-1)); 
                od;
                incl:=SSortedList(newincl);
                i:=1;
            fi;
        fi;
        i:=i+1;
        count:=count+1;
        if count > 500 then
            Print("\nWARNING: didn't finish puting  ", incl, "  in canonical form \n");
            return incl;
        fi;
    od;
    # Make sure the last value is the max (if not, swap it)
    if incl[n][2]<> m then
        p:=Positions(List([1..n-1],x->incl[x][2]),m);
        tmp:=incl[n];
        incl[n]:=incl[p[Size(p)]];
        incl[p[Size(p)]]:=tmp;
    fi;
    return incl;
end;

