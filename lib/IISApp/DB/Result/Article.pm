package IISApp::DB::Result::Article;
use base 'DBIx::Class::Core';

__PACKAGE__->table('article');
__PACKAGE__->add_columns(
  id => { 
    data_type => 'integer',
    is_nullable => 0,
    is_auto_increment => 1,
  },
  title => +{qw( 
    data_type text 
    is_nullable 0 
  )},
  snipet => {data_type => 'text'},
  url => {data_type => 'text', is_nullable => 0},
  cluster => +{qw(
    data_type integer
    is_nullable 0
  )},
  finished => {data_type => 'boolean', is_Nullable => 0},
);

__PACKAGE__->set_primary_key('id');

1;
