###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######生信自学网: http://www.biowolf.cn/
######QQ：2749657388
######交流Q群：219795300
######微信: 18520221056
use strict;
use warnings;

my $pvalueOpt=0.05;
my $normalCount=0;
my $tumorCount=0;

open(RF,"CIBERSORT-Results.txt") or die $!;
open(WF,">CIBERSORT.filter.txt") or die $!;
while(my $line=<RF>){
	chomp($line);
	my @arr=split(/\t/,$line);
	my $sample=shift(@arr);
	my $RMSE=pop(@arr);
	my $Correlation=pop(@arr);
	my $Pvalue=pop(@arr);
	if($.==1){
		print WF "id\t" . join("\t",@arr) . "\n";
	}
  else{
  	if($Pvalue<$pvalueOpt){
  	  print WF "$sample\t" . join("\t",@arr) . "\n";
  	  my @sampleArr=split(/\-/,$sample);
  	  if($sampleArr[3]=~/^0/){
  	  	$tumorCount++;
  	  }
  	  else{
  	  	$normalCount++;
  	  }
  	}
  }
}
close(WF);
close(RF);

print "normal count: $normalCount\n";
print "tumor count: $tumorCount\n";

###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######生信自学网: http://www.biowolf.cn/
######QQ：2749657388
######交流Q群：219795300
######微信: 18520221056