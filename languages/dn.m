classdef dn
    % MATLAB scripting side to Dynamic Number (dn) package
    % Defines a MATLAB class that defines IO.

    properties
        name       % dn list name
        filename   % filename (with extension, but without directory)
        directory  % file directory with filename
    end
    methods
        function obj = dn(list_name, varargin)
            % Create a dn object
            %
            %  list = dn('name') creates the list name in the current directory.
            %  list = dn('name','..') creates the list name one directory above
            %    this directory.

            if (nargin<1) || (nargin>2)
                error('Incorrect number of input arguments.')
            end
            if nargin == 1
                list_dir = '.';
            else
                list_dir = varargin{1};
            end
            if ischar(list_name)
                obj.name = list_name;
                obj.filename = strcat(list_name,'.dnlist');
            else
                error('Provide a MATLAB string as list name')
            end
            if ischar(list_dir)
                if strcmp(list_dir(length(list_dir)),'/')
                    obj.directory = strcat(list_dir, obj.filename);
                else
                    obj.directory = strcat(list_dir, '/', obj.filename);
                end
            else
                error('Provide a MATLAB string as list directory')
            end

            f = fopen(obj.directory,'w');
            fprintf(f,'\\dndeclare{%s}\n',obj.name);
            fprintf(f,'\\dnsetcurrent{%s}\n',obj.name);
            fclose(f);

        end
        function[] = add(obj, name, value, varargin)
            % Add a value to the liist
            %
            %  list.add('A',N) adds the value of N to key A.
            %  list.add('B',N,'\radians') adds the command \unit{N}{\radians} to
            %    the key B.
            
            if isnumeric(value)
                value = num2str(value);
            end
            if ~ischar(value)
                error('The value argument must be a of type string or numberic.')
            end
            switch nargin
                case 3
                    f = fopen(obj.directory,'a');
                    fprintf(f,'\\pgfkeys{/dynamicnumber/%s/%s = %s}\n',obj.name,name,value);
                    fclose(f);
                case 4
                    f = fopen(obj.directory,'a');
                    fprintf(f,'\\pgfkeys{/dynamicnumber/%s/%s = \\unit{%s}{%s}}\n',obj.name,name,value,varargin{1});
                    fclose(f);
                otherwise
                    error('Incorrect number of arguments.')
            end
        end
    end
end
