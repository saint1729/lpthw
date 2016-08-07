# Exercise 2.2 Write a regular expression that matches any word that starts with
# pre and ends in al; for example, “prejudicial” and “prenatal.”

sub print_matches {
	my $pattern = "^pre(.)*al$";
	my $file = shift;
	
	open my $fh, $file;
	
	while(my $line = <$fh>) {
		if($line =~ $pattern) {
			print $line;
		}
	}
}