#!/usr/bin/perl -w
use strict;
my ($all_gene,$imp_gene,$out)=@ARGV;
die usage() if @ARGV==0;

my %hash;
open F,"$all_gene" or die "$!";
while(<F>) {
	chomp;
	my @ss=split;
	$hash{$ss[0]}=1;
}
open I,"$imp_gene" or die "$!";
open O,"+>$out" or die "$!";
while(<I>) {
	chomp;
	my @ss=split;
	if(exists($hash{$ss[3]})) {
		print O "$ss[0]\t$ss[1]\t$ss[2]\t$ss[3]\t$ss[3]\t$ss[4]\n";
	}
}
sub usage{
	my $die=<<DIE;
	usage :perl hash.pl 
DIE
}
