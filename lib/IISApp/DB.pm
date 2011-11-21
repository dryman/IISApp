package IISApp::DB;
use base 'DBIx::Class::Schema';
IISApp::DB->load_namespaces;

1;

=head1 NAME

IISApp::DB Perl object <-> relational database mapper.

=head2 SYNOPSIS

    use IISApp::DB;
    my $schema = IISApp::DB->connect($dbi_dsn, $user, $pass);

=cut

__END__
