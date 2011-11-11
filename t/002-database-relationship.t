#!/usr/bin/env perl -w
use strict;
use Test::More;
use DateTime;

use Test::DBIx::Class{
  schema_class => 'IISApp::DB',
  connect_info => ['dbi:SQLite:dbname=test.db','',''],
}, qw|Article User RandomSet TimeStamp|;


fixtures_ok [
  User => [
    [qw|ptt userAgent set_id|],
    [qw|dryman opera 0|],
  ],
],"Insert user dryman fixture";

my $test_time1 = DateTime->now;
my $test_time2 = DateTime->now;
fixtures_ok sub {
  my $schema = shift;
  my $ts_rs = $schema->resultset('TimeStamp');
  my $dryman = $schema->resultset('User')->next;
  $ts_rs->create({
    time => $test_time1,
    article_id => 0,
    user_id => $dryman->id,
  });
  return $ts_rs->create({
    time => $test_time2,
    article_id => 0,
    user_id => $dryman->id,
  });
},"Insert two time_stamps ok";

my $dryman = ResultSet('User')->next;
my @dt_rss = $dryman->time_stamps->all;
is $dt_rss[0]->time, $test_time1, "can get time_stamp 1 from dryman";
is $dt_rss[1]->time, $test_time2, "can get time_stamp 2 from dryman";
  
done_testing;
