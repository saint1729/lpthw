use strict;
use warnings;

sub rev {
	my @list;
	
	while(my $elt = pop @_) {
		push @list, $elt;
	}

	return @list;
}

my @list = (1, 2, 3, 4);
@list = rev @list;
print @list;