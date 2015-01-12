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
        if (length($line) <=55){
			print $line."\n";
			next;
		}
		if (substr($line,40,1) eq ' '){
			$line = substr($line,0,40);
			print $line."... <Read More>\n";
			next;
		}
		$line= substr($line,0,40);
		my $char = ' ';
		my $i = rindex($line, $char);
		$line = substr($line,0,$i);
		print $line."... <Read More>\n";
    }
    close(INFILE);
}