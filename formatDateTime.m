function [str] = formatDateTime(t, showMS, delimiter)
%formatDateTime Formats datetime to a DD.HH:MM:SS(.FFF) time format
%   INPUT:
% t: datetime
% showMS: format msecs
% delimiter: a char delimiter
%
%   OUTPUT:
% invMat: The pinv result (returns NaN if r_condest=inf, singularity).
% bReplaced: a boolean that determines whether we actually replaced 
%    any 0z on the diag of R or did not found any zeros on its diag
% r_condest: result of condest(r) (a measurement for singularing)
% bMatIsSingular: Mat is singular (generate rand deficient warn)

%% DEMO
    if (nargin == 0) %DEMO
        t = datetime('now');
    end
    
    if (nargin <= 1)
        showMS = 0;
    end
    
    if (nargin <= 2)
        delimiter = ''; %empty char
    end
    
    if (isempty(delimiter))
        fmt = 'dd/mm/yyyy HH:MM:SS';
        if (showMS)
            fmt = [fmt '.FFF'];
        end
    else
        d = delimiter;
        fmt = ['dd' d 'mm' d 'yyyy' d 'HH' d 'MM' d 'SS'];
        if (showMS)
            fmt = [fmt d 'FFF'];
        end
    end
    str = datestr(t,fmt);
end
