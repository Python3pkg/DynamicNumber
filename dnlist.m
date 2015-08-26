function [  ] = dnlist( name, varargin )
%dnlist Create new dynamic number list
%
%   dnlist(name) creates a new dynamic number list in the current directory
%  
%   dnlist(name, folder) creates a new dynamic number list in direcory
%   folder.

if nargin == 1
    dir = '.';
else
    dir = varargin{1};
end;

% create variables
f_name = strcat(name,'.dnlist');    % file name
f_dir = strcat(dir,'/',f_name);     % file location

% write to file
f = fopen(f_dir,'w');
fprintf(f,'%s\n',strcat('\dndeclare{',name,'/}'));
fprintf(f,'%s\n',strcat('\dnsetcurrent{',name,'}'));
fclose(f);

% create stream
global dnstream
dnstream.(genvarname(name)).dir = f_dir;
dnstream.(genvarname(name)).name = name;
dnstream.dncurrent = dnstream.(genvarname(name));

end

