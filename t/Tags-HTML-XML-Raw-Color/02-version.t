use strict;
use warnings;

use Tags::HTML::XML::Raw::Color;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Tags::HTML::XML::Raw::Color::VERSION, 0.01, 'Version.');
