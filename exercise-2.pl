#!/usr/bin/perl -w
#
# 2. Hibachi Numbers
#
# Hibachi numbers are the series (2, 2, 2, 8, 32, 512, ...). The series starts with 
# three twos. Each number thereafter is the product of the previous three. Write a 
# function to return an array of the first n Hibachi numbers, where n is passed in as 
# a parameter.
#
# example: ./exercise-2.pl -n=6
#
# ------------------------------------------------------------------------------------- #

use strict;
use Getopt::Long qw(GetOptions);
use Data::Dumper;

my $env = { v => 1 };
GetOptions( $env, "h", "d=s", "v=s", "n=s" );

my @h_list = (2,2,2);
hibachi_number( $env->{'n'} );
print "Hibachi list: @h_list\n";

sub hibachi_number {
    my $n = shift;
    print "Find Hibachi Number at: $n\n";
    foreach my $index (3 .. $n-1) {
        my $result = $h_list[$index-3] * $h_list[$index-2] * $h_list[$index-1];
        push @h_list, $result;
    }
    return @h_list;
}

1;

__END__
