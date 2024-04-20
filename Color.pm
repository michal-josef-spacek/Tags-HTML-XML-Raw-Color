package Tags::HTML::XML::Raw::Color;

use base qw(Tags::HTML);
use strict;
use warnings;

our $VERSION = 0.01;

sub _cleanup {
	my $self = shift;

	delete $self->{'_xml'};

	return;
}

sub _init {
	my ($self, $xml) = @_;

	$self->{'_xml'} = $xml;

	return;
}

# Process 'Tags'.
sub _process {
	my $self = shift;

	if (! exists $self->{'_xml'}) {
		return;
	}

	$self->{'tags'}->put(
		['b', 'pre'],
		['b', 'code'],
		['a', 'id', 'xmlContainer'],
		['a', 'class', 'xml language-xml'],
		['d', $self->{'_xml'}],
		['e', 'code'],
		['e', 'pre'],
	);

	return;
}

sub _process_css {
	my $self = shift;

	return;
}

1;
