sub grep_file {
	my $pattern = shift;
	my $file = shift;
	
	open my $fp, $file;
	
	while(my $line = <$fp>) {
		if($line =~ m/$pattern/) {
			print $line;
		}
	}
}

grep_file @ARGV;