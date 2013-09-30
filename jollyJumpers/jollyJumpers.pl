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
        if (&isJolly($line)){
            print "Jolly\n";
        } else {
            print "Not jolly\n";
        }
    }
    close(INFILE);
}

sub isJolly {
    my @list = split(' ', $_[0]);
    my $size = $list[0] + 1 ;
    my $n = 2;
    
    while ($n < $size){
        if (($n + abs($list[$n-1] - $list[$n])) != $size){
            return 0;
        }
        $n++;
    }
    return 1;
}