# vim: set ft=perl :

use strict;
use warnings;

use Test::More;
use Tree::BPTree;
require 't/runtests.pl';
use vars qw( &runtests @splitstr );

plan tests => 2 * 48 * @splitstr;

sub test {
	my ($tree, $splitstr) = @_;

	my $i = 0;
	my @pairs = map { [ $i++, $_ ] } @$splitstr;
	my @sorted = map { $_->[0] } sort { $a->[1] cmp $b->[1] } @pairs;

	for my $pair (@pairs) {
		my $value = $tree->find($pair->[1]);
		my @values = $tree->find($pair->[1]);
		my @matched = grep { $_->[1] eq $pair->[1] } @pairs;

		is($value, $matched[0][0]);
		is_deeply(\@values, [ map { $_->[0] } @matched ]);
	}
}

runtests;