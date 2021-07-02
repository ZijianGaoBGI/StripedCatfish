die "Usage: $0 lack of parameter\n" unless @ARGV == 1;
open(FIN,"$ARGV[0]") or die($!);
open(OUT1,">HUMAN.id.txt") or die($!);
open(OUT2,">MOUSE.id.txt") or die($!);
open(OUT3,">ZEBRAFISH.id.txt") or die($!);
open(OUT4,">OTHER.id.txt") or die($!);
while($line=<FIN>){
	@arr=split(/\(/,$line);	
			if($line=~/(\S+_HUMAN)/g){
				print OUT1 $arr[0],"\t",$1,"\n";
			}
			elsif($line=~/(\S+_MOUSE)/g){
				print OUT2 $arr[0],"\t",$1,"\n";
				}
			elsif($line=~/(\S+_ZEBRA)/g){
                                print OUT3 $arr[0],"\t",$1,"\n";
                                }
                        elsif($line=~/(\S+_\S+\()/g){
                                print OUT4 $arr[0],"\t",$1,"\n";
                                }

	}			

close FIN;
close OUT1;
close OUT2;
close OUT3;
close OUT4;
