use strict;
use warnings;
use inc::Module::Install;

name 'IISApp';
all_from 'lib/IISApp.pm';

requires  'DBIx::Class' => 0.081;
requires  'DBD::SQLite' => 1.33;
requires  'Mojolicious' => 2.26;

test_requires 'Test::More' => 0.42;
test_requires 'Test::DBIx::Class' => 0.25;

WriteAll;
