# vim: set ft=perl :

use strict;
use warnings;

use Test::More;
use Tree::BPTree;
require 't/runtests.pl';
use vars qw( &runtests @splitstr );

plan tests => 48 * @splitstr;

sub test {
	my ($tree, $splitstr) = @_;

	my $i = 0;
	my @pairs = map { [ $i++, $_ ] } @$splitstr;
	my @sorted = map { $_->[0] } sort { $a->[1] cmp $b->[1] } @pairs;

	while (@pairs > 0) {
		my $pair = shift @pairs;
		@sorted = grep { $_ != $pair->[0] } @sorted;

		$tree->delete(reverse(@$pair));

#		print STDERR "TREE: [ ", join(', ', $tree->flattened_values), " ]\n";
#		print STDERR "LIST: [ ", join(', ', @sorted), " ]\n";

		is_deeply([ $tree->flattened_values ], \@sorted);
	}
}

runtests;
