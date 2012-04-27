#!/usr/bin/perl -w
#
# 3. Histogram
#
# Write code to generate a histogram display based on the frequency of occurrence of 
# characters in the first argument to the program. The results should be sorted by the 
# number of occurrences of each character.
#
# example: ./exercise-3.pl -str="Mississippi borders Tennessee."
#
# ------------------------------------------------------------------------------------- #

use strict;
use Getopt::Long qw(GetOptions);
use Data::Dumper;

my $env = { v => 1 };
GetOptions( $env, "h", "d=s", "v=s", "str=s" );

my $sorted = { };
my %seen;
foreach my $char (split('', $env->{'str'})) {
    next if (exists $seen{$char});
    my $count = (my @var) = $env->{'str'} =~ /[$char]/g;
    push @{ $sorted->{$count} }, $char;
    $seen{$char} = $count;
}

#foreach my $char (reverse sort { $seen{$a} <=> $seen{$b} } keys %seen) {
#foreach my $char (keys %seen) {
#    unless (exists $sorted->{$seen{$char}}) {
#        $sorted->{$seen{$char}} = [ ];
#    }
#    push @{ $sorted->{$seen{$char}} }, $char;
#}

foreach my $total (reverse sort keys %$sorted) {
    my @chars = sort @{ $sorted->{$total} };
    foreach my $char (@chars) {
        print "  $char: " . ('#' x $seen{$char}) . "\n";
    }
}

1;

__END__