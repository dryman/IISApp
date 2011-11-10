#!/usr/bin/env perl -w
use strict;
use Test::More ;

use Test::DBIx::Class {
  schema_class => 'IISApp::DB',
  connect_info => ['dbi:SQLite:dbname=test.db','',''],
};

fixtures_ok [
  Article => [
    ['title','snipet','url','cluster','finished'],
    ['hi','hoho','hehe','0','0'],
    ['ho','haha','hehe','0','0'],
  ],
], 'Installed stupid fixtures';

done_testing;
