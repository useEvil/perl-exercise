#!/usr/bin/perl -w
#
# 1. Randomize List
#
# The function will take an arbitrary number of inputs, and should return a list with 
# the same items, but in a random order.
#
# example: ./exercise-1.pl
#
# ------------------------------------------------------------------------------------- #

use strict;
use Getopt::Long qw(GetOptions);
use Data::Dumper;


my @r_list = randomizeList(1,2,3,4,49,'foo',38,'bar',9,-1);
print "randomly list: @r_list\n";

sub randomizeList {
    my @list = @_;
    my(%index, @sorted);
    print "original list: @list\n";
    my $random;
    while (1) {
        $random = int(rand(scalar @list));
        unless (exists $index{$random}) {
            $index{$random}++;
            push @sorted, $list[$random];
        }
        last if (@sorted == @list);
    }
    return @sorted;
}

1;

__END__