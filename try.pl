#!/usr/bin/perl

# Quick script I have used for debugging some features.

use Data::Dumper;
use Tree::BPTree;

my $teststr = 'ANDREW STERLIN GHANENKAMP';
my @splitstr = split //, $teststr;

my $i = 0;
my $tree = Tree::BPTree->new;
$tree->insert($_, $i++) for (@splitstr);

$i = 0;
foreach (@splitstr) {
	print Dumper($tree);
	print "DELETE ($_, $i)\n";
	$tree->delete($_, $i++);
}

print Dumper($tree);
