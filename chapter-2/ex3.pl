# • Find all the words that begin with a|b and end with a|b. The list should include
# “adverb” and “balalaika”.
# • Find all the words that either start and end with a or start and end with b. The
# list should include “alfalfa” and “bathtub”, but not “absorb” or “bursa”.
# • Find all the words that begin with un or in and have exactly 17 letters.
# • Find all the words that begin with un or in or non and have more than 17 letters.

use strict;
use warnings;

sub print_a_or_b {
	my $file = shift;
	my $pattern = qr/\b(a|b|A|B)\S*(a|b|A|B)\b/;
	
	open (my $fp, $file);
	
	my $cnt = 0;
	while(my $line = <$fp>) {
		if($line =~ $pattern) {
			print $line;
			$cnt = $cnt+1;
		}
	}
	print $cnt;
}

sub print_a_and_b {
	my $file = shift;
	my $pattern1 = qr/\b(a|A)\S*(a|A)\b/;
	my $pattern2 = qr/\b(b|B)\S*(b|B)\b/;
	
	open (my $fp, $file);
	
	my $cnt = 0;
	while(my $line = <$fp>) {
		if($line =~ $pattern1 or $line =~ $pattern2) {
			print $line;
			$cnt = $cnt+1;
		}
	}
	print $cnt;
}

sub print_un_or_in_limit {
	my $file = shift;
	my $pattern = qr/(?i)\b(un|in)(\S{15})\b/;
	
	open (my $fp, $file);
	
	my $cnt = 0;
	while(my $line = <$fp>) {
		if($line =~ $pattern) {
			print $line;
			$cnt = $cnt+1;
		}
	}
	print $cnt;
}

sub print_un_or_in_nolimit {
	my $file = shift;
	my $pattern = qr/(?i)\b(un|in)(\S{16,})\b/;
	
	open (my $fp, $file);
	
	my $cnt = 0;
	while(my $line = <$fp>) {
		if($line =~ $pattern) {
			print $line;
			print \1;
			$cnt = $cnt+1;
		}
	}
	print $cnt;
}

# print_a_or_b @ARGV;
# print_a_and_b @ARGV;
# print_un_or_in_limit @ARGV;
print_un_or_in_nolimit @ARGV;
