#!/usr/bin/perl
 open(FHIN2,"<$ARGV[0]");
 my %gene;
 while(<FHIN2>)
  {
    chomp;
    my @array=split;
    $gene{$array[0]}=$_;
  }
 close FHIN2;
 my $file=$ARGV[1];
 foreach (keys %gene)
  {
    print "\n";
    my @array=split(/\t+/,$gene{$_});
    print "$array[0]\t$array[1]\t$array[2]\t$array[3]";
    my $cmdstr='samtools view '.$file.' '.$array[1].':'.$array[2].'-'.$array[3]. '| awk \'$4>='.$array[2].'\'';
    my $result=`$cmdstr`;
    my $weight=0;
    if ($result!~/^\s*$/)
      {
        my @alines=split("\n",$result);
        my $number_alines=@alines;
        foreach my $aline (@alines)
         {
           if ($aline=~/invalid/)
             {
               die("invalid region:\n$cmdstr\n");
             }
           my @pieces=split("\t",$aline);
#           if($aline=~/NH\:i\:(\S+)/)
#             {
               my $num=$1;
               if($num>1)
                 {
                   next;
                 }
               $weight++;
#             }
         }
      }
     print "\t$weight";
  }

