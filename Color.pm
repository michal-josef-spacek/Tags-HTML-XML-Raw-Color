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

	$self->{'script_js'} = [];
	$self->script_js(<<"END");
	const escapeHtml = (html) => {
		return html
			.replace(/&/g, "&amp;")
			.replace(/</g, "&lt;")
			.replace(/>/g, "&gt;")
			.replace(/"/g, "&quot;")
			.replace(/'/g, "&#039;");
	}
	document.addEventListener('DOMContentLoaded', (event) => {
		const rawXml = `$xml`;
		const xmlContainer = document.getElementById('xmlContainer');
		xmlContainer.innerHTML = escapeHtml(rawXml);
		hljs.highlightElement(xmlContainer);
	});
END

	return;
}

sub _prepare {
	my $self = shift;

	$self->css_src({
		'link' => 'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.3.1/styles/default.min.css',
		'media' => 'all',
	});
	$self->script_js_src('https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.3.1/highlight.min.js');

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
