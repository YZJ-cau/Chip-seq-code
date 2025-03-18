#!/usr/bin/perl -w
use strict;
my ($all_gene,$imp_gene,$out1)=@ARGV;
die usage() if @ARGV==0;

my %hash;
open F,"$all_gene" or die "$!";
while(<F>) {
	chomp;
	my @ss=split;
	$hash{$ss[3]}=1;
}
open I,"$imp_gene" or die "$!";
open O1,"+>$out1" or die "$!";
while(<I>) {
	chomp;
	my @ss=split/\t/,$_;
	my $ID=$ss[3];
	if(exists($hash{$ID})){
		print O1 "$_\n";
	}
}
	
sub usage{
	my $die=<<DIE;
	usage :perl hash.pl 
DIE
}
