#!/usr/bin/env perl
use Mojo::Base -strict;

use Test::More tests => 4;
use Test::Mojo;

use_ok 'IISApp';

my $t = Test::Mojo->new('IISApp');
$t->get_ok('/welcome')->status_is(200)->content_like(qr/Mojolicious/i);
