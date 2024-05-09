#!/bin/perl -w 

use strict;
use feature qw/say/;
use List::Util qw/max min/;

sub Three_Sum_Closet{
	my $target = shift;
	my @nums = sort {$a <=> $b} @_;
	my $result;
	my $diff_min = "inf";

	foreach (0 .. $#nums - 2){
		my $l = $_ + 1;
		my $r = $#nums;	

		while ($l < $r){
			my $sum = $nums[$l] + $nums[$r] + $nums[$_];
			my $d = abs($sum - $target);
			
			if ($d < $diff_min){
				$diff_min = $d;
				$result = $sum;
			}
			$l += 1 if $sum < $target and $l < $r;
			$r -= 1 if $sum > $target and $l < $r;
			return $sum if $sum == $target;	
		}
	}

	return $result
}

say(Three_Sum_Closet(1, -1, 2, 1, -4)); # 2 # ((-1) + 2 + 1)
say(Three_Sum_Closet(5, 3, 0, 5, -2, -7, 1)); # 4 # (5 + (-2) + 1)

