#! /usr/bin/perl

use strict;
use warnings;
use POSIX ();

my $count = 0;
my $sum = 0;
my $value = 2;

while ($count < 1000){
    if (&isPrime()){
        $sum += $value;
        $count++;
    }
    $value++;
}

print "$sum\n";

sub isPrime {
    my $limit = POSIX::floor(sqrt($value));
    my $d1 = 2;
    while ($d1 <= $limit){
        if ($value % $d1 == 0){
            return 0;
        }
        $d1++;
    }
    return 1;
}