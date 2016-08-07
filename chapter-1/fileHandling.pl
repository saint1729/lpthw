# open my $fh, 'C:\\Users\\nagasai\\Desktop\\perl\\listLiterals.pl';
# while (my $line = <$fh>) {
	# print $line;
# }

use strict;
use warnings;

sub print_file {
	my $file = shift;
	open FILE, $file;

	while (my $line = <FILE>) {
		print $line;
	}
}

sub cat {
	while (my $file = shift) {
		print_file $file;
		print "\n\n";
	}
}

cat @ARGV;