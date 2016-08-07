sub echo {
	my @arg = @_;
	my @words = @arg[0, 2];
	print "@words\n";
}
echo "alpha","beta","gamma"