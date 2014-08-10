#!/usr/bin/perl

use warnings;
use strict;

while (<>) {
    chomp;
    my $line = $_;
    my @line = split /\s+/;

    next unless @line;

    if ($line[0] =~ '^M') {
        $line[0] = 'Xfake_' . $line[0];
        $line[4] = '0';
        $line[5] = 'fake_' . $line[5];
    }

    if ($line[0] =~ '^Q') {
        $line[0] = 'Xfake_' . $line[0];
        $line[4] = '0 fake_' . $line[4];
    }

    print join(' ', @line), "\n"
}
