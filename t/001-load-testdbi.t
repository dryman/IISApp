#!/usr/bin/env perl -w
use strict;
use Test::More ;

use Test::DBIx::Class {
  schema_class => 'IISApp::DB',
  connect_info => ['dbi:SQLite:dbname=test.db','',''],
}, 'Article','User','RandomSet';

fixtures_ok [
  Article => [
    ['id','title','snipet','url','cluster','finished'],
    [0,'hi','hoho','hehe','0','0'],
    [1,'ho','haha','hehe','0','0'],
  ],
  User => [
    [qw|ptt userAgent set_id|],
    [qw|dryman safari 0|],
  ],
  RandomSet => [
    [qw|ord set_id article_id|],
    [1,0,0],
    [0,0,1],
  ],
], 'Installed stupid fixtures';

ok my $user = User->find({ptt=>'dryman'}) => 'dryman is the user';
is_fields $user, +{qw|ptt dryman userAgent safari set_id 0|}, "attr correct";

my $dryman = ResultSet('User')->next;
my @random_nums= $dryman->random_nums->search(undef,{order_by => {-asc => 'ord'}});
is $random_nums[0]->ord, 0, "order of random num one should be 0";
is $random_nums[1]->ord, 1, "order of random num two should be 1";


done_testing;
