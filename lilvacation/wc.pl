#!/usr/bin/perl
use strict;
use warnings;

my ($file) = @ARGV;
 
if (not defined $file) {
  die "Need file path\n";
}

open(FILE, "<$file") or die "Could not open file: $!";

my ($lines, $words, $chars) = (0,0,0);
my %count;

while (<FILE>) {
    $lines++;
    $chars += length($_);
    my @strings = split(/\s+/, $_);
    $words += scalar(@strings);
    foreach my $str (@strings) {
    	$count{$str}++;
	}
}

print("Number of characters: $chars\n");
print("Number of words: $words\n");
print("Number of lines: $lines\n");

print("Frequency of words in the file:\n--------------------------------");
 
foreach my $str (sort keys %count) {
    printf "%-31s %s\n", $str, $count{$str};
}