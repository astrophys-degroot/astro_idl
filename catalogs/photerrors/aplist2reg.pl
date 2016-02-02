#!/usr/bin/perl

$file1 = $ARGV[0];

if (@ARGV<2){
	$color="green";
} else {
	$color=$ARGV[1];
}
open(FILE, $file1) or die $!;
@LINES=<FILE>;
close(FILE) or die $!;
print "# Region file format: DS9 version 6.1.2\n";
print "global color=".$color."\n";

foreach(@LINES){

	if($_=~ m/(\S+)\s+(\S+)\s+(\S+)?\s*$/){
    if (length $3){
        print "image;circle ".$1." ".$2." ".$3."\n";
    } else {
        print "image;circle ".$1." ".$2." 5\n"
    }
	}
}
