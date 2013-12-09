# /usr/bin/perl

use strict;
use warnings;

&main(@ARGV);

sub main {
    open (INFILE, "<$_[0]") or die ("Cannot open file $_[0] for reading: $!");
    while (my $line = <INFILE>){
        next if ($line =~ m/^\s*$/); # skip blank lines
        $line =~ s/(^\s*|\s*$)//g; # remove leading and trailing spaces
        (my $values, my $places) = split (/ : /, $line);
        my @value = split (/ /, $values);
        my $f;
        my $s;
        my $t;
        foreach my $place (split (/, /, $places)){
            ($f, $s) = split(/-/, $place);
            $t = $value[$f];
            $value[$f] = $value[$s];
            $value[$s] = $t;
        }
        print("@value\n");
    }
}