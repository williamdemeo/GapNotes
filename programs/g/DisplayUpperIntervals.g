DisplayUpperIntervals:=function(G,n1,n2,H)
    local cc, K, k, intKG, core;
    cc:=ConjugacyClassesSubgroups(G);
    
    for k in [n1..n2] do 
        K:=Representative(cc[k]); 
        if IsSubgroup(K,H) then
            core:=Core(G,K);
            if Order(core)=1 then  # We are only interested in corefree K.
                intKG:=IntermediateSubgroups(G,K);
                if Length(intKG.subgroups)<50 then
                    Print("\n", k, "  ", Length(intKG.subgroups)+2, "  ", intKG.inclusions, "\n");
                fi;
            fi;
        fi;
    od;
end;

