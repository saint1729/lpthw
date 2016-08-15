# • Using the subroutines in this chapter, write a program that reads a text file
# and counts the number of times each word is used. Hint: use the lc operator to
# convert words to lower case, and the first argument of split to list the characters
# that should separate words. You can download the text of many out-of-copyright
# books from gutenberg.net.
# • Modify the program so that it prints the number of unique words that appear
# in the book.
# • Modify the program so that it prints the most commonly used word and the
# number of times it appears.

sub croak { die "$0: @_: $!\n"; }

sub read_line {
	our %hash;
	my @list = split " ", shift;
	foreach my $word (@list) {
		$hash{lc($word)}++;
	}
}

sub read_file {
	my $file = shift;
	open (FILE, $file) || croak "Couldn't open $file";
	while (my $line = <FILE>) {
		read_line $line;
	}
}

sub print_count {
	our %hash;
	my @list = keys %hash;
	foreach my $ele (@list) {
		print "$ele   $hash{$ele}\n";
	}
}

sub print_unique {
	our %hash;
	my @list = keys %hash;
	foreach my $ele (@list) {
		if($hash{$ele} == 1) {
			print "$ele\n";
		}
	}
}

sub print_common {
	our %hash;
	my @list = keys %hash;
	my $max = 1, $ans = @list[0];
	foreach my $ele (@list) {
		if($hash{$ele} > $max) {
			$ans = $ele;
			$max = $hash{$ele};
		}
	}
	print "$ans  $max\n";
}

read_file @ARGV;
#print_count;
#print_unique;
print_common;