#!/usr/bin/perl -w
#
# 5. IP Address Matching
#
# Create an object-oriented class that accepts an IP address in CIDR format, and then can 
# verify whether an input IP address is in the range, and also can return the range of IP 
# addresses in the network.
#
# example: ./exercise-5.pl -ip=55.234.32.221
#
# ------------------------------------------------------------------------------------- #

use strict;
use Getopt::Long qw(GetOptions);
use Data::Dumper;

my $env = { v => 1 };
GetOptions( $env, "h", "d=s", "v=s", "ip=s" );

my $network = IPNetwork->new( '55.234.32.0/24' );

foreach my $ip ('55.234.32.221', '55.234.31.34') {
    my $in_range = $network->inRange( $ip );
    print "Is [$ip] in Range: " . ($in_range ? 'Yes' : 'No') . "\n";
}

package IPNetwork;


sub new {
    my $class = shift;
    my $cidr  = shift;
    my $self  = { 'cidr' => $cidr };
    bless $self, $class;
    return $self;
}

sub inRange {
    my $self  = shift;
    my $class = ref($self) || $self;
    my $ip    = shift || return undef;
    my @range = $self->getIPRange($self->cidr);

    # check range here
    # return true or false
}


sub getIPRange {
    my $self  = shift;
    my $class = ref($self) || $self;
    my $cidr  = shift || $self->cidr;
    my @subs  = split('\.', $cidr);
    my($start, $end) = split('/', $subs[-1])
    # return range;
}


sub cidr { ref($_[0]) ? $_[0]->{'cidr'} : undef }

1;

__END__