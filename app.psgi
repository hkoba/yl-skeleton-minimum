# -*- perl -*-
use strict;
use FindBin;
use lib "$FindBin::Bin/lib", "$FindBin::Bin/local/lib/perl5";

use YATT::Lite::WebMVC0::SiteApp -as_base, -Entity, qw/*CON/;

use YATT::Lite::WebMVC0::Partial::Session2;

{
  my $site = MY->load_factory_for_psgi($0);

  # {
  #   Entity foo => sub {
  #     my ($this) = @_;
  #     $CON->param('foo');
  #   };
  # }

  if ($main::{'breakpoint'} and my $sub = main->can("breakpoint")) {
    $sub->();
  }

  return $site if $site->want_object;

  $site->to_app;
}
