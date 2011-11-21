package IISApp;
use strict;
use 5.010;
our $VERSION = "0.002";

use IISApp::DB;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc" (this plugin requires Perl 5.10)
  $self->plugin('PODRenderer');

  # Routes
  my $r = $self->routes;

  # Normal route to controller
  $r->route('/welcome')->to('example#welcome');
  $r->route('/login')->to('entry#login')->name('login');
  $r->any('/'=>sub{},'index');

}

=head1 NAME 

IISApp main controller

=head1 Overview

Perl L<Mojolicious> framework is designed for MVC (Model, View, Controller)
software architectural pattern. MVC was originally desigined for GUI interface
that seperates application logic, presentation and input. Now most modern web
frameworks including L<Mojolicious> adopt this pattern.

                .----------------.     .-------.
    Request  -> |                | <-> | Model |
                |                |     '-------'
                |   Controller   |
                |                |     .-------.
    Response <- |                | <-> | View  |
                '----------------'     '-------'

The Controller is L<Mojolicious> it's self, the basic syntax is:

    $r = Mojolicous::Routes->new; # or, $r=$self->routes;
    $r->route('/article')->to('Controller#action')->name('action');

Then, in the lib/IISApp/Controller.pm file, you can add some methods to handle
the action.

    package IISApp/Controller; 
    # Controller should change name for better semantics

    sub action {
      my $self = shift;

      # do some work here...
    }

    1;

Last, in lib/IISApp/Templates/controller/action.html.ep

    % layout 'default';
    % title 'Crowdsourcing Project';
    <header>
      <h1>Main title</h1>
    </header>
    <aside>
    </aside>

    <div id="main" role="main">
      <div id="content">
      </div>
    </div>

    <footer>
      <div class="footer"></div>
    </footer>

The Model is described in L<IISApp::DB>. Check the documents there.

=cut

1;
__END__
