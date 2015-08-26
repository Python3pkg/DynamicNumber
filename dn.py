__author__ = 'Olivier Pieters'

dynamic_number = {"streams": {}, "current stream": None}

def current_stream(stream=None, p=False):
    # set new stream if needed
    if stream is not None:
        dynamic_number["current stream"] = stream

    # print stream if needed
    if p:
        print(dynamic_number["current stream"])

    # return string
    return dynamic_number["current stream"]

def dnadd(name, num, unit=None, stream=None):

    # check if unit provided
    add_unit = False
    if unit is not None:
        add_unit = True
        unit = str(unit)
    # set stream if not provided
    if stream is None:
        stream = current_stream()

    # convert num to string
    num = str(num)

    # write to file
    f = open(stream["dir"], 'a')
    f.write("\\pgfkeys{dynamicnumber/%s/%s = %s}\n" % (stream["name"], name, num))
    f.close()

def dnlist(name, file_dir="."):
    file_name = name + ".dnlist"
    file_dir = file_dir + "/" + file_name

    # write to file
    f = open(file_dir,'w')
    f.write("\\dndeclare{%s}\n" % name)
    f.write("\\dnsetcurrent{%s}\n" % name)
    f.close()

    # set class variables
    dynamic_number["streams"][name] = {"dir": file_dir, "name": name}
    dynamic_number["current stream"] = dynamic_number["streams"][name]
