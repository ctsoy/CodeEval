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
        (my $sent, my $tokens) = split (/, /,$line);
        my @token = split(//,$tokens);
        foreach $_ (@token){
            $sent =~ s/$_//g;
        }
        print "$sent\n";
    }
    close(INFILE);
}