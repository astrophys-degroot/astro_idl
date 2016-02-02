#!/usr/bin/perl
$file1 = $ARGV[0];
open(FILE, $file1) or die $!;
@LINES=<FILE>;
close(FILE) or die $!;

foreach(@LINES){

	if($_=~ m/image;circle (\d+) (\d+) (\d+)/){
	
	print $1."\t".$2."\t".$3."\n";
	}
	if($_=~ m/circle\((\d+),(\d+),(\d+)/){
	
	print $1."\t".$2."\t".$3."\n";
	}
}
