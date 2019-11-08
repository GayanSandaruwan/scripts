#!/usr/bin/perl
use strict;
use warnings;

sub fib {
    my $n = shift;

    if ($n == 0 or $n == 1) {
        return 1 
    }

    return (fib($n-1)+fib($n-2));            # recursive calling
}


my $nm =0;
do{

	print "Please enter value of N: ";
	$nm = <STDIN>;

	if ($nm >=0) {
		print "f(1) = ";
		print fib($nm);
		print "\n";
	}
} while ($nm >=0);