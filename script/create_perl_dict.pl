#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use Pod::Functions;

my $file;
if (@ARGV == 1) {
    $file = shift @ARGV;
} else {
    die "Usage: pdict.pl <file_name>\n";
}

open my $fh, '>:encoding(UTF-8)', $file
    or die "Can't open file: $!";

foreach my $func (sort keys %Flavor) {
    print $fh $func . "\n";
}

close $fh;
