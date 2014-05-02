#! /usr/bin/perl
use strict;
use warnings;

for (my $i = 1; $i <= 12; $i++){
    print $i;
    for (my $j = 2; $j <=12; $j++){
        printf "%4d",$i * $j;
    }
    print "\n";
} 
