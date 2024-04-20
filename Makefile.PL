use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Tags helper for view raw XML with colors.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.03;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'Tags-HTML-XML-Raw-Color';
perl_version 5.008;
readme_from 'Color.pm';
recursive_author_tests('xt');
requires 'Class::Utils' => 0.02;
requires 'Error::Pure' => 0.07;
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/Tags-HTML-XML-Raw-Color/issues';
resources 'homepage' => 'https://github.com/michal-josef-spacek/Tags-HTML-XML-Raw-Color';
resources 'repository' => 'git://github.com/michal-josef-spacek/Tags-HTML-XML-Raw-Color';
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
