#! /usr/bin/perl
use strict;
use warnings;

open (FH, $ARGV[0]) || die "Cannot open: $!\n";

while (<FH>) {
    chomp;
    (my $words, my $orders) = split(/;/, $_);
    my @word = split (/ /, $words);
    my @order = split (/ /, $orders);
    my @sentence;
    for (my $i = 0; $i < @order; $i++){
        $sentence[$order[$i]-1] = $word[$i];
    }
    if (scalar @sentence < scalar @word){
        $sentence[@word]= pop @word;
    }
    my $l = pop @word;
    my $last = "";
    foreach my $w(@sentence){
        if ($w){ $last = $last . $w . " ";}
        else { $last = $last . "$l ";}
    }
    $last =~ s/\s+$//;
    print"$last\n";
}

close(FH);
