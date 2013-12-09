# /usr/bin/perl

use strict;
use warnings;

&main(@ARGV);

sub main {
    open(INFILE, "<$_[0]") or die("Cannot open file");
    while (my $line = <INFILE>){
        next if ($line =~ m/^\s*$/);
        $line =~ s/(^\s*|\s*$)//g;
        my @word = split(/ /,$line);
        my $word = @word;
        for(my $i = $word-1; $i >= 0; --$i){
            print("$word[$i] ");
        }
        print("\n");
    }
    close(INFILE);
}