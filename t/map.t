# vim: set ft=perl :

use strict;
use warnings;

use Test::More;
use Tree::BPTree;
require 't/runtests.pl';
use vars qw( &runtests @splitstr );

my $i = 0;
my @pairs = map { [ $i++, $_ ] } @splitstr;

# Taken and modified from the _Perl Cookbook_ (2nd Ed.) by Tom Christiansen
# et. al.  published by O'Reilly
my (%seen, @collapsed);
for my $pair (@pairs) {
	push @{$seen{$$pair[1]}}, $$pair[0];
}

# This is some crazy list operator stacking to get a sorted list of pairs
my @sorted = 
	map { [ reverse(@$_) ] }
	sort { $a->[0] cmp $b->[0] }
	map { [ $_, $seen{$_} ] } 
	keys(%seen);

plan tests => 48;

sub test {
	my ($tree, $splitstr) = @_;

	my $i = 0;
	my @rtree  = $tree->map(sub { [ reverse(@_) ] });

	is_deeply(\@rtree, \@sorted);
}

runtests;
