#!/usr/bin/perl

while (<>) {
    s/ +$//;
    s/^(M\S*\s+\S+\s+\S+\s+)(\S+\s+)(.*)$/\1\2\2\3/;
    print;
}
