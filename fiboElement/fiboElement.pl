#! /usr/bin/perl

use strict;
use warnings;

&main(@ARGV);
exit(0);

sub main {
    open(INFILE, "<$_[0]") or die("Cannot open file $_[0] for reading: $!");
    while(my $line = <INFILE>) {
        next if($line =~ m/^\s*$/); # skip blank lines
        $line =~ s/(^\s*|\s*$)//g; # remove leading and trailing spaces
        if ($line < 2){
            print "$line\n";
        }else{
            &findFibo($line);
        }
    }
    close(INFILE);
}

sub findFibo {
    my $left = 0;
    my $right = 1;
    my $value;
    my $i;
    for ($i = 2; $i <= $_[0]; $i++){
        $value = $left + $right;
        $left = $right;
        $right = $value;
    }
    print "$value\n";
}