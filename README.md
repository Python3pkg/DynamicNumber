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
2. Now the contents should be in `Documents/MATLAB/DynamicNumber`.
3. Open MATLAB.
4. Set path to include the cloned folder. The Set path can be found in the File menu on older MATLAB installations or HOME, Environment in newer installations.

### Python

TODO

Quick start
-----------

### LaTeX

LaTeX usage is very straightforward. Load the package with `\usepackage{dynamicnumber}` and next load a dyamic number list with `\dnreadfile{list}`. Now you can start using your dynamic variables with `\dnget{variable}`.

More information and additional commands can be found in the documentation.

**Attention!** Do not attempt to create a `pgfkey` with the name `dynamicnumber`, it will conflict with the internal workings of the package.

### MATLAB and Python

Create a dynamic number list with the `dn()` command, then add symbolic links with the `add`-method.

The `add`-method requires at least 2 arguments: the symbolic link name and a value (either numerical or string). The optinal third can specify a unit for the value. The symbolic link will be stored to typeset both number and unit in a nice way, with the `units` package (`\unit{<value}{<unit>}`).

Example

```Some complicated commands, that in the end assign the following value to temperature:
temparture = 23.4
temp_predictions = dn('TemperaturePredictions')
temp_predictions.add('tomorrow',temparture,'C')
```

**Note!**: If you wish to use special LaTeX commands such as `\Celcius` or `\metre`, your need to be careful with the use of the backslash. In MATLAB you only need to add one backslash because of the way it is parsed, but in Python you need to add two of them! This is needed because the backslash is also use for escape sequences.

### Contributions

The libraries are basic in a sence they do not have a lot of features of options. This is intintional. Users can easily adopt them to suit their own needs without having to go through 100s of lines of code and the learning curve is very small. So the main goal is to have a library that support many platforms, is identical on all of those and is simple to use.

Bug fixes and small feature improvements are always welcome, you can use a pull request and/or contact me via [my website](users.ugent.be/~opieters) or by email on `dynamic (underscore) number (at) opieters (dot) be`.


### License

See the `LICENSE` file.
