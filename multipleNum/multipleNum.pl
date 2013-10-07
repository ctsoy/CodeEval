#! /usr/bin/perl

use strict;
use warnings;
use POSIX ();

my $limit;
my $base;

&main(@ARGV);
exit(0);


sub main {
    open(INFILE, "<$_[0]") or die("Cannot open file $_[0] for reading: $!");
    while(my $line = <INFILE>) {
        next if($line =~ m/^\s*$/); # skip blank lines
        $line =~ s/(^\s*|\s*$)//g; # remove leading and trailing spaces
        ($limit, $base) = split(/,/, $line);
        my $multiple = $base;
        if ($limit < $multiple){
            print "\n";
            next;
        }
        while ($limit > $multiple){
            $multiple += $base;
        }
        print "$multiple\n";
    }
    close(INFILE);
}