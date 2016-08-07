my @array = @ARGV;
my $scalar = @array;
print "@array\n";
print "$scalar\n";
@array = $scalar;
print "@array\n";