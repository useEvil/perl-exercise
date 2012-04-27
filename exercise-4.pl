#!/usr/bin/perl -w
#
# 4. Intersect
#
# Develop a function that takes two or more array refs as input, and returns a new array 
# that contains the intersection of the inputs.
#
# example: ./exercise-4.pl
#
# ------------------------------------------------------------------------------------- #

use strict;
use Getopt::Long qw(GetOptions);
use Data::Dumper;


my @list = intersect( [3,4,3,29,492,23,5], [1..19], [5,4,29] );
print "intersect list: @list\n";

sub intersect {
    my @lists = @_;
    my $total = scalar @lists;
    my $tally = { };
    foreach my $list (@lists) {
        my %seen;
        foreach my $item (@$list) {
            next if ($seen{$item});
            $tally->{$item}++;
            $seen{$item}++;
        }
        
    }
    my @intersect;
    foreach my $item (keys %$tally) {
        push @intersect, $item if ($tally->{$item} == $total);
    }
    return @intersect;
}


1;

__END__