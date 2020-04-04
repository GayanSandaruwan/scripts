 #!/usr/bin/perl -w
# use strict;

my @argv;
my $file = $ARGV[0];


use warnings;
use strict;
use feature qw{ say };
use Data::Dumper;

my @words;
my %word_hash;

open (IN, $file) or die "Could not open file: $!";
while (my $line = <IN>) {
	chomp $line;
	# print "$line : ";
	push(@words , $line);
	my $vowels = $line;
	$vowels =~ s/[^aeiou]//g;
	push(@{$word_hash{$vowels}},$line);

}
close(IN);

foreach my $key (sort keys %word_hash){

   foreach my $word (sort @{$word_hash{$key}}){
   		print("$word\n");
   }
}