#!/usr/bin/env perl
use Mojo::Base -strict;

use Test::More tests => 7;
use Test::Mojo;

use_ok 'IISApp';

my $t = Test::Mojo->new('IISApp');
$t->get_ok('/login')->status_is(200)->content_like(qr|wrong user|);
$t->post_form_ok('/login'=>{
  user => 'dryman',
  passwd =>  'crowdsourcing',
})->status_is(200)->content_like(qr|Welcome|);
