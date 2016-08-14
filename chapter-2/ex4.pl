# Exercise 2.4 In a regular expression, the backslash sequence \1 refers to the first
# (prior) capture sequence in the same expression. As you might guess, \2 refers to the
# second sequence, and so on.
# Write a regular expression that matches all lines that begin and end with the same
# character.

use strict;
use warnings;

sub print_start_end {
	my $pattern = qr/^(.).*\1$/;
	my $file = shift;
	
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

print_start_end @ARGV;