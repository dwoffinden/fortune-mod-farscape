#!/usr/bin/perl

use strict;
use warnings;

use MediaWiki::API;

my $mw = MediaWiki::API->new();
$mw->{config}->{api_url} = 'https://en.wikiquote.org/w/api.php';

my $page = $mw->get_page( { title => 'Farscape' } )->{ '*' };

print $page
