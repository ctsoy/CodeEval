#! /usr/bin/perl

use Config;

my $i = ''. $Config{byteorder};
if ($i < reverse($i)){
   print "LittleEndian\n";
} else{
   print "BigEndian\n";
} 
