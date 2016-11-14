function [ filters ] = genFilters()
%GENFILTERS Generate filter for convolution

    MIN_VAL = -1;
    MAX_VAL = 1;

    % Left diagonal 
    filterLdiag = ones(3,3)*MIN_VAL;
    filterLdiag(1,1) = MAX_VAL;
    filterLdiag(2,2) = MAX_VAL;
    filterLdiag(3,3) = MAX_VAL;

    % Right diagonal 
    filterRdiag = ones(3,3)*MIN_VAL;
    filterRdiag(1,3) = MAX_VAL;
    filterRdiag(2,2) = MAX_VAL;
    filterRdiag(3,1) = MAX_VAL;

    % Cross 
    filterCross = ones(3,3)*MIN_VAL;
    filterCross(1,1) = MAX_VAL;
    filterCross(1,3) = MAX_VAL;
    filterCross(2,2) = MAX_VAL;
    filterCross(3,1) = MAX_VAL;
    filterCross(3,3) = MAX_VAL;

    filters{1} = filterLdiag;
    filters{2} = filterRdiag;
    filters{3} = filterCross;


end

