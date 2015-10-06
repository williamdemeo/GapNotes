IntransGset2:=function(G,H,K)
    local x;
    x:=Concatenation(RightCosets(G,H), RightCosets(G,K));;
    return Action(G, x, OnRight);
end;

