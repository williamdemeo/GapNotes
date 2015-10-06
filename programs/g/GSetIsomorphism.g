ShowUpperInterval:=function(G)
    local ms, msM, K, H, M, countM, countH, intHG, numint, GmodH, b, act;
    Print("\nG = ", G, " = ", StructureDescription(G));
    Print("\nGetting maximal subgroup class reps...");
    ms:=MaximalSubgroupClassReps(G);
    Print("\nThere are ", Length(ms), " maximal subgroup classes.");
    countM:=0;
    for M in ms do
        countM:=countM+1;
        Print("\n", countM, ".");
        msM:=MaximalSubgroupClassReps(M);
        Print("\n   There are ", Length(msM), " 2nd max subgps below maxsg[", countM, "].");
        countH:=0;
        for H in msM do
            Print("\n   --------------------------------------------------");
            countH:=countH+1;
            Print("\n   ", countM, ".", countH);
            intHG:=IntermediateSubgroups(G,H);
            numint:=Length(intHG.subgroups);
            Print("\n   There are ", numint, " intermediate subgroups above 2nd maxsg[", countH, "].");
            if numint < 20 then
                Print("\n   The covering relations are");
                Print("\n   ",intHG.inclusions);
            fi;
            if numint>4 and numint < 8 then
                Print("\n======== NOTICE THIS ONE ===========");
                # GmodH:=RightCosets(G,H);
                # act:=Action(G,GmodH,OnRight);
                # Print("\n   The non-trivial congruences are:");
                # for b in AllBlocks(act) do
                #     Print("\n   ",Orbit(G,b,OnSets));
                # od;
            fi;
        od;
    od;
    Print("\n"); 
end;
            
    
   
      
      