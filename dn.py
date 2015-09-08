__author__ = 'Olivier Pieters'

"""Dynamic Number module.

This module adds a variable (and more generally, even string) export option to LaTeX. This way, symbolic links between Python and LaTeX are possible so variables are always up to date, even within paragraphs.

"""

class dn:
    """Dynamic Number class

    Dynamic Number (dn) objects represent a list of variables with unique symbolic names. Different list can be used side by side.
    """
    def __init__(self, name, file_dir="."):
        """Construct a dn-object.

        name     -- indicates the Dynamic Number list name (should not include a file extension!)
        file_dir -- directory to store the dn list, by default the current directory is used.
        """

        self.name = name
        self.filename = name + ".dnlist"

        try:
            if file_dir[-1] == "/":
                self.file_dir = file_dir + self.filename
            else:
                self.file_dir = file_dir + "/" + self.filename
        except IndexError:
            print("File directory incorrect. Using current directory")
            self.file_dir = "./" + filename

        f = open(self.file_dir,'w')
        f.write("\\dndeclare{%s}\n" % name)
        f.write("\\dnsetcurrent{%s}\n" % name)
        f.close()

    def add(self, name, num, unit=None):
        """Add symbolic link to Dynamic Number list.

        name -- name of the symbolic link
        num  -- value of the link (if not a string, conversion is done with str())
        unit -- if num is a numerical value, a unit can be added to invoke the \unit{}{} LaTeX command
        """
        # check if unit provided
        if unit is not None:
            add_unit = True
            unit = str(unit)
        else:
            add_unit = False

        # convert num to string
        num = str(num)

        # write to file
        f = open(self.file_dir, 'a')
        if add_unit:
            f.write("\\pgfkeys{dynamicnumber/%s/%s = \unit{%s}{%s}}\n" % (self.name, name, num, unit))
        else:
            f.write("\\pgfkeys{dynamicnumber/%s/%s = %s}\n" % (self.name, name, num))
        f.close()
