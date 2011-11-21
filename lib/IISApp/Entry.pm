package IISApp::Entry;
use strict;
use warnings;
use Mojo::Base 'Mojolicious::Controller';
use 5.10.0;


sub login {
  my $self = shift;

  my $user = My::User->new(user => $self->param('user')) 
    or return $self->render(text => 'wrong user');
  return $self->render(text => 'Welcome')
    if $user->check($self->param('passwd'));

  $self->render(text=> 'wrong password');
}

package My::User;
use strict;
use warnings;

my %USER = (
  dryman => 'crowdsourcing',
  jim => 'rdf',
  mouth => 'arduino',
  albert => 'workflow',
);

sub new {
  my $class = shift;
  my $self = {@_};
  bless ($self, $class);
  return $self if $USER{$self->{user}};
  return 0;
}

sub check {
  my ($self, $passwd) = @_;
  return 1 if $USER{$self->{user}} eq $passwd;
  return 0;
}

1;
