function [ ] = dnadd( name, num, varargin)
%dnadd Write a LaTeX expression to dyanmic number list
%
%   dnadd(num, name) adds LaTeX expression num to current dynamic number
%   stream stream with index name. The current stream is the last stream to
%   be created with dnlist() or set with dncstream.
%
%   dnadd(name, num, unit, stream) or dnadd(name, num, stream, unit)
%   To overwrite the default (current) strem value, a stream can be
%   specified as optinal argument. Additionally, a unit can be added. This 
%   results in the following LaTeX output: \unit{num}{unit}. By default the 
%   unit is empty and num is taken as the LaTeX expression. The order in 
%   which stream and unit are specified is not imporant, as long as they are 
%   specified after the mandatory arguments. 

% only one optional argument is allowed
narginchk(2, 4)

add_unit = 0;
stream = dncstream();

% read input arguments
for i = 1:nargin-2
    if isstruct(varargin{i})
        stream = varargin{i};
    elseif ischar(varargin{i})
        unit = varargin{i};
        add_unit = 1;
    end;
end

% convert number to string if needed
if isnumeric(num)
    num = num2str(num);
end;

% add unit if needed
if add_unit
    num = strcat('\unit{',num,'}{',unit,'}');
end

% append to file
f = fopen(stream.dir,'a');
fprintf(f,'\\pgfkeys{/dynamicnumber/%s/%s = %s}\n',stream.name,name,num);
fclose(f);

end
