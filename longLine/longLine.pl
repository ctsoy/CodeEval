# /usr/bin/perl

use strict;
use warnings;

my $limit;
my @result;

&main(@ARGV);
foreach my $s (@result){
    print "$s\n";
}

sub main {
    open(INFILE, "<$_[0]") or die("Cannot open file");
    while (my $line = <INFILE>){
        next if ($line =~ m/^\s*$/);
        $line =~ s/(^\s*|\s*$)//g;
        if (defined $limit){
            &store($line);
        } else {
            $limit = $line;
        }
    }
    close INFILE;
}

sub store {
    if (scalar @result == 0){
        $result[0] = $_[0];
    } else {
        my $i = (scalar @result)-1;
        while ($i >=0){
            if (length $_[0] > length $result[$i]){
                my $t = $result[$i];
                $result[$i] = $_[0];
                $result[$i + 1] = $t;
            } else {
                if (scalar @result < $limit){
                    push (@result, $_[0]);
                } else {
                    last;
                }
            }
            --$i;
        }
    }
    if (scalar @result > $limit){
        pop @result;
    }
}