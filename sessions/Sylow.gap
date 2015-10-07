Sylow := function(n, p)
    
# Purpose : To find the possible numbers of Sylow p-groups
# of a group of order n.
# Input : n, p - positive integers
# Output : S - a list
    
    local M, S;
    M := List([0..Int((n-1)/p)], k -> 1 + k*p);
    S := Filtered(M, m -> (n mod m) = 0);
    return S;
    
end;