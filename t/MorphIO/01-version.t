# Pragmas.
use strict;
use warnings;

# Modules.
use MorphIO;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($MorphIO::VERSION, 0.01, 'Version.');
