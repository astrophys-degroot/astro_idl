from sys import argv

script, input_file = argv

def printall(f):
    print f.read()

def rewind(f):
    f.seek(0)

def printaline(linecount, f):
    print linecount, f.readline()

curfile = open(input_file)

print 'Lets print the whole file: \n'
printall(curfile)

print 'Now lets rewind, kind of like a tape.'
rewind(curfile)

print 'Lets print three lines:'
currentline = 3
printaline(currentline, curfile)
currentline = 4
printaline(currentline, curfile)
currentline = 7
printaline(currentline, curfile)
