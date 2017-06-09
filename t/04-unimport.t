#!/usr/bin/perl
use warnings;
use strict;

use Test::More tests => 3;

use FindBin;

use ARGV::OrDATA;

my $file = "$FindBin::Bin/input.txt";

is scalar <>, "data 1\n", 'read line 1 from data';

@ARGV = $file;
is scalar <>, "data 2\n", 'changes to @ARGV ignored';

'ARGV::OrDATA'->unimport;
@ARGV = $file;
is scalar <>, "file 1\n", 'unimport works';


__DATA__
data 1
data 2
data 3
