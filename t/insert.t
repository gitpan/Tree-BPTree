# vim: set ft=perl :

use strict;
use warnings;

use Test::More tests => 48;
use Tree::BPTree;
require 't/runtests.pl';
use vars '&runtests';

sub test {
	my ($tree, $splitstr) = @_;

	my $i = 0;
	my @pairs = map { [ $i++, $_ ] } @$splitstr;
	my @sorted = map { $_->[0] } sort { $a->[1] cmp $b->[1] } @pairs;

	is_deeply([ $tree->flattened_values ], \@sorted);
}

runtests;
