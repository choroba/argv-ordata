#!/usr/bin/perl
use warnings;
use strict;

use Test::More tests => 3;

use FindBin;
use lib $FindBin::Bin;

use My;
use ARGV::OrDATA qw{ My };

while (<>) {
    is $_, "package $.\n", "Read line $. from package";
}
ok eof, 'end of package';


__DATA__
data 1
data 2

