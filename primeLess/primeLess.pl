#! /usr/bin/perl

use strict;
use warnings;
use POSIX ();

&main(@ARGV);
exit(0);

sub isPrime {
    my $limit = POSIX::floor(sqrt($_[0]));
    my $d1 = 2;
    while ($d1 <= $limit){
        if ($_[0] % $d1 == 0){
            return 0;
        }
        $d1++;
    }
    return 1;
}

sub main {
    open(INFILE, "<$_[0]") or die("Cannot open file $_[0] for reading: $!");
    while(my $line = <INFILE>) {
        next if($line =~ m/^\s*$/); # skip blank lines
        $line =~ s/(^\s*|\s*$)//g; # remove leading and trailing spaces
        if ($line >= 2){
            print "2";
        }
        my $value = 3;
        while ($value < $line){
            if (&isPrime($value)){
                print ",$value";
            }
            $value++;
        }
        print "\n";
    }
    close(INFILE);
}