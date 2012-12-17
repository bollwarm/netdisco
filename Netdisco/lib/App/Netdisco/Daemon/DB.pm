use utf8;
package App::Netdisco::Daemon::DB;

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;

our $VERSION = 1; # schema version used for upgrades, keep as integer

use Path::Class;
use File::Basename;

my (undef, $libpath, undef) = fileparse( $INC{ 'App/Netdisco/Daemon/DB.pm' } );
our $schema_versions_dir = Path::Class::Dir->new($libpath)
  ->subdir("DB", "schema_versions")->stringify;

__PACKAGE__->load_components(qw/Schema::Versioned/);
__PACKAGE__->upgrade_directory($schema_versions_dir);

1;