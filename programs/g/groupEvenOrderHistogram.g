# A GAP program to draw a histogram of number of groups of a given order,
# for groups of all orders N1 up to N2.
#
# Author: William DeMeo <williamdemeo@gmail.com>
# Date: 2010.08.01

groupEvenOrderHistogram:=function(N1,N2)
    # INPUTS
    # N1, N2   (positive integers) look at groups of orders N1 up to N2.
    
    local i, j, jj, G, ncc, mscr, nmscr, pathname, filename, outfile, rt0, rt1, elapsed;
            
    pathname := "~/pub/DeMeo/research/LatticeTheory/GAP/";
    filename := Concatenation(pathname, "outputs/groupEvenOrderHistogram", String(N1), "To", String(N2), ".out");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    Print("|G|\n");
    PrintTo(outfile, "|G|\n");
    for i in [N1..N2] do
        if IsEvenInt(i) then
            Print(i, " ");
            AppendTo(outfile, i, " ");
            jj := NumberSmallGroups(i);
            for j in [1..jj] do
                Print("=");
                AppendTo(outfile, "=");
            od;
            Print(jj, "\n");
            AppendTo(outfile, jj, "\n");
        fi;
    od;
    Print("\n");
    AppendTo(outfile, "\n");
end;;
          
          