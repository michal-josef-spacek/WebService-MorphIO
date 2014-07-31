# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'TODO';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'MorphIO';
readme_from 'MorphIO.pm';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=MorphIO';
resources 'homepage' => 'https://github.com/tupinek/MorphIO';
resources 'repository' => 'git://github.com/tupinek/MorphIO';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
