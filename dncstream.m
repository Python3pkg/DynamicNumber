function [ varargout ] = dncstream(varargin)
%dncstream Get or set current dynamic number stream
%
%   cstream = dncstream(nstream,'p') sets the current dynamic number stream 
%   to nstream, returns the current stream to cstream and prints the new
%   current stream to the console. If no stream is specified, the current
%   one remains unchanged. If no output is requested, none is returned and
%   if 'p' is not an argument, the stream is not printed. Argument order is
%   not important.
%
%   In essence, dncstream does not perform an action.

narginchk(0, 2)

print_stream = 0;

global dnstreams

for i = 1:nargin
    if isstruct(varargin{i})
        dnstreams.dncurrent = varargin{i};
    elseif ischar(varargin{i}) && strcmp(varargin{i},'p')
            print_stream = 1;
    end;
end;

if nargout == 1 
    varargout{1} = dnstreams.dncurrent;
else
    if print_stream
        disp(dnstreams.dncurrent);
    end
end

end

