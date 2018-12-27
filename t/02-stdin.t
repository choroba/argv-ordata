#!/usr/bin/perl
use warnings;
use strict;

use FindBin;

open my $PIPE, '|-', $^X, "$FindBin::Bin/pipe.pl" or die $!;
print {$PIPE} << '__PIPE__';
pipe 1
pipe 2
__PIPE__
close $PIPE;
