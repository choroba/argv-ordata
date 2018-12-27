#!/usr/bin/perl
use warnings;
use strict;

use Test::More tests => 3;

use FindBin;

my $PIPE;
if ('MSWin32' eq $^O && $] < 5.022) {
    open $PIPE, '-|', "$^X $FindBin::Bin/script.pl" or die $!;
} else {
    open $PIPE, '-|', $^X, "$FindBin::Bin/script.pl" or die $!;
}

while (<$PIPE>) {
    is $_, "data $.\n", "Read line $. from DATA";
}
ok eof $PIPE, 'closed DATA';
