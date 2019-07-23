use strict;
use warnings;
package Hello;

$Hello::VERSION = '0.1';

sub hello {
 my ($you) = @_;
 return "Hello, $you!";
}

sub bye{
  my ($you) = @_;
  return "Goodbye , $you!";
}
1;
