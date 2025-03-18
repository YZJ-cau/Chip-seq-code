#!/usr/bin/perl 

open(R, "$ARGV[0]")or die("Can not open $ARGV[0]:$!");
open(L, "$ARGV[1]")or die("Can not open $ARGV[1]:$!");
my %hash;
while(<R>){
        if(/^\n/) 
         {
           next;
         }
	$line=$_;
	chomp$line;
	@in=split(/\s+/,$line);
	$hash{$in[0]}=$in[2];
}
my $wa=<L>;
my $file;
$file=`samtools view -q 20 $ARGV[2]|wc -l`;
while(<L>)
  {
    if(/^\s+/)
      {
        next;
      }
    $line=$_;
    chomp$line;
    @in=split(/\s+/,$line);
    $length=$hash{$in[0]};
    my $rpkm=$in[-1]*1000000000/($length*$file);
    print "$in[0]\t$rpkm\n";
  }
close(R)or die;
close(L)or die;
