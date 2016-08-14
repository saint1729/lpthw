# Exercise 2.2 Write a regular expression that matches any word that starts with
# pre and ends in al; for example, “prejudicial” and “prenatal.”

use strict;
use warnings;

sub print_matches {
	my $pattern = qr/^Pre.*al\s*$/;
	my $file = shift;
	
	open my $fp, $file;
	
	while(my $line = <$fp>) {
		if($line =~ $pattern) {
			print $line;
		}
	}
}

print_matches @ARGV;