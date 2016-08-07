# Exercise 1.1 The glob operator takes a pattern as an argument and returns a list
# of all the files that match the given pattern. A common use of glob is to list the files
# in a directory.
# my @files = glob "$dir/*";
# The pattern $dir/* means “all the files in the directory whose name is stored in $dir”.
# See the documentation of glob for examples of other patterns.
# Write a subroutine called print dir that takes the name of a directory as a parameter
# and that prints the file in that directory, one per line.

$dir = shift;
my @files = glob "$dir/*";

sub print_dir {
	while(my $file = shift) {
		print $file;
		print "\n\n";
	}
}

print_dir @files;