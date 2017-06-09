#!/usr/bin/perl
use warnings;
use strict;

use Test::More tests => 3;

use FindBin;

open my $PIPE, '-|', "$FindBin::Bin/script.pl", "$FindBin::Bin/input.txt" or die $!;

while (<$PIPE>) {
    is $_, "file $.\n", "Read line $. from file";
}
ok eof $PIPE, 'end of file';
