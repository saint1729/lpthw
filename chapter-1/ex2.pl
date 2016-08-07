# Exercise 1.2 Modify the previous subroutine so that instead of printing the name
# of the file, it prints the contents of the file, using print file.

$dir = shift;
my @files = glob "$dir/*";

sub print_file {
	my $file = shift;
	open my $fh, $file;
	
	while (my $line = <$fh>) {
		print $line;
	}
}

sub print_dir {
	while(my $file = shift) {
		#print $file;
		print_file $file;
		print "\n\n";
	}
}

print_dir @files;