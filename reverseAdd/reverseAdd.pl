#!/usr/bin/perl

use strict;
use warnings;

&main(@ARGV);
exit(0);

sub main {
    open(INFILE, "<$_[0]") or die("Cannot open file $_[0] for reading: $!");
    while(my $line = <INFILE>) {
        next if($line =~ m/^\s*$/); # skip blank lines
        $line =~ s/(^\s*|\s*$)//g; # remove leading and trailing spaces
        &checkPalindrome($line);
    }
    close(INFILE);
}

sub checkPalindrome {
    my $round = 0;
    my $sum = $_[0];
    do {
        $sum += reverse $sum;
        $round++;
    }while((reverse $sum)ne $sum);
    print "$round $sum\n";
}
