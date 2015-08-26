README
======

What is it?
-----------

Dynamically typeset numbers generated in different kinds of scripts in LaTeX. The aim is to reduce errors resulting from out-of-date numbers by directly setting them in the number generating file and importing a symbolic link in the LaTeX source file.

Installation
------------

Depending on your confinguration, one or more might not be applicable.

### LaTeX

TODO

### MATLAB

Add the necessary functions to MATLAB's path. 

1. Clone the directory in your MATLAB folder (`Documents/MATLAB`).
*  Now the contents should be in `Documents/MATLAB/DynamicNumber`.
*  Open MATLAB.
*  Set path to include the cloned folder. The Set path can be found in the File menu on older MATLAB installations or HOME, Environment in newer installations.

### Python

TODO

Quick start
-----------

### LaTeX 

LaTeX usage is very straightforward. Load the package with `\usepackage{dynamicnumber}` and next load a dyamic number list with `\dnreadfile{list}`. Now you can start using your dynamic variables with `\dnget{variable}`.

More information and additional commands can be found in the documentation.

**Attention!** Do not attempt to create a `pgfkey` with the name `dynamicnumber`, it will conflict with the internal workings of the package.

### MATLAB

First you need to create a list in with the *dynamic numbers* will be stored. This is done with the `dnlist` command: `dnlist(list_name, list_directory)`. If the list should be created in the current directory, `list_directory` can be omitted.

Once a list has been created, start adding values with `dnadd(name, number)`. `name` is the symbolic name, used to get the value in LaTeX, `number` is the number or LaTeX expression to be stored. 

**Note** that because of the way MATLAB parses these strings one backslash (` \ `) should be used, not two! So we write: `dnadd(fraction,'\frac{1}{2}')`.

**Attention!** Do not create a *global* variable with the name `dnstreams`. This name is reserved for library use.

### Python

TODO

### Contributions

The libraries are basic in a sence they do not have a lot of features of options. This is intintional. Users can easily adopt them to suit their own needs without having to go through 100s of lines of code and the learning curve is very small. So the main goal is to have a library that support many platforms, is identical on all of those and is simple to use. 

Bug fixes and small feature improvements are always welcome, you can use a pull request and/or contact me via [my website](users.ugent.be/~opieters) or by email on `dynamic (underscore) number (at) opieters (dot) be`.


### License

See the `LICENSE` file.



