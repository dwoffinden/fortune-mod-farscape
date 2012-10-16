#!/usr/bin/perl

use strict;
use warnings;

use utf8;

use MediaWiki::API;

my $mw = MediaWiki::API->new();
$mw->{config}->{api_url} = 'http://en.wikiquote.org/w/api.php';

# TODO fetch a specific, stable revision
my $page = $mw->get_page( { title => 'Farscape' } )->{ '*' };

# remove everything after, and including, the cast section
$page =~ m/== Cast ==/;
$page = substr( $page, 0, $-[0] );

# create seperators from horizontal rules, {,sub}section boundaries, quotes
$page =~ s/^\s*<hr.+?\/>\s*$/%/gim;

$page =~ s/^===.+?===$/%/gm;

$page =~ s/^==.+?==$/%/gm;

$page =~ s/^\s*\*\s*$/%/gm;

# remove empty lines
$page =~ s/\n\n/\n/g;

# collapse any multiple occurances of '%'
$page =~ s/%\n(%\n)+/%\n/g;

# remove preceding whitespace
$page =~ s/^\s+//gm;

# remove everything before the first '%'
$page =~ m/^%$/m;
$page = substr( $page, $+[0]+1 );

# remove leading colons
$page =~ s/^://gm;

# replace bold text with *bold*.
$page =~ s/'''(.+?)'''/*$1*/g;

# replace italic text with /italic/.
$page =~ s/''(.+?)''/\/$1\//g;

# replace wiki links with just the text
$page =~ s/\[\[w:.+?\|(.+?)\]\]/$1/g;

print $page;
