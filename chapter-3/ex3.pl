# Exercise 3.3 Modify the program from the previous section to print the 20 most
# common words in a file and their frequencies.

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

sub byvalue {
	our %hash;
	$hash{$b} <=> $hash{$a};
}

sub print_n_values {
	our %hash;
	$n = shift;
	$i = 0;
	my @list = sort byvalue keys our %hash;
	while($i < $n) {
		print "@list[$i] => $hash{@list[$i]}\n";
		$i = $i+1;
	}
}

read_file @ARGV;
print_n_values 20;
