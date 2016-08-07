# Exercise 1.3 The operator -d tests whether a given file is a directory (as opposed to
# a plain file). The following example prints “directory!” if the variable $file contains
# the name of a directory.
# if (-d $file) {
# print "directory!";
# }
# Modify cat.pl so that if any of the command line arguments are directories, it invokes
# print dir to print the contents of the files in the directory.

use strict;
use warnings;

sub print_file {
	my $file = shift;
	open my $fh, $file;
	
	print $file;
	
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

sub cat {
	while (my $fileOrDir = shift) {
		if(-d $fileOrDir) {
			my @files = glob "$fileOrDir/*";
			print_dir @files;
		}
		else {
			print_file $fileOrDir;
		}
		print "\n\n";
	}
}

cat @ARGV;