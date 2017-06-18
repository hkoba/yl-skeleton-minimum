# -*- perl -*-
use strict;
use FindBin;
use lib "$FindBin::Bin/lib", "$FindBin::Bin/local/lib/perl5";

use YATT::Lite::WebMVC0::SiteApp -as_base, -Entity, qw/*CON/;

{
  my $site = MY->load_factory_for_psgi($0);

  # {
  #   Entity foo => sub {
  #     my ($this) = @_;
  #     $CON->param('foo');
  #   };
  # }

  return $site if $site->want_object;

  $site->to_app;
}
