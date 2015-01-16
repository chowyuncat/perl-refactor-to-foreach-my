use strict;
use warnings;

# TODO: Test mode 
# foreach (@blah)
# foreach(@blah)
# foreach $i ($blah)
# foreach my $i (@blah)

my $num_args = $#ARGV + 1;
if ($num_args != 1) {
	print "Usage: Perl filename\n";
	exit;
}
my $in_filename = $ARGV[0];

open(my $ifh, '<', $in_filename) or die "Could not open file '$in_filename' $!";
# open(my $ofh, '>', $out_filename) or die "Could not open file '$out_filename' $!";

my $lineNumber = 0;
while (my $line = <$ifh>) {
	++$lineNumber;
	chomp $line;
	# TODO: also find for, as it's a synonym for foreach
	if ($line =~ /foreach(?!\smy)/) {
		printf "$lineNumber: $line\n";
	}
	else {
		next;
	}

	# Find opening brace
	# TODO: Allow no brace for loops
	if ($line =~ /{/) {
		
	}
	else {
		while (my $innerLine = <$ifh>) {
			if ($innerLine =~ /{/) {
				last;
			}
		}
	}

	while (my $innerLine = <$ifh>) {
		if ($innerLine =~ /}/) {
			last;
		}
	}
	

   
    # print $ofh $line
}

close($ifh);