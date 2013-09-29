#!/usr/bin/perl

use strict;
use warnings;
use POSIX ();

my $N;
my @X;


&main(@ARGV);
&findSquares();
exit(0);

sub main {
    open(INFILE, "<$_[0]") or die("Cannot open file $_[0] for reading: $!");
    while(my $line = <INFILE>) {
        next if($line =~ m/^\s*$/); # skip blank lines
        $line =~ s/(^\s*|\s*$)//g; # remove leading and trailing spaces
        if (!($N)){
            $N = $line;
        } else {
            push (@X, $line);
        }
    }
    close(INFILE);
}

sub findSquares {
    while ($N-- > 0){
        $_ = shift @X;
        my $count = 0;
        my $l = POSIX::floor(sqrt($_));
        my $r = sqrt($_ - $l**2);
    
        while (($l >= $r)&&($l >=0)){
            if ($r == POSIX::floor($r)){
                $count++;
            }
            $l--;
            if ($l >= 0){
                $r = sqrt($_ - $l**2);
            }
        
        }
    
        print "$count\n";
    }
}