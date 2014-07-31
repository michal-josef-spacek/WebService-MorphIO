package MorphIO;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);
use Error::Pure qw(err);
use IO::Barf qw(barf);
use LWP::Simple qw(get);
use URI;
use URI::Escape qw(uri_escape);

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# API key.
	$self->{'api_key'} = undef;

	# Project.
	$self->{'project'} = undef;

	# Select.
	$self->{'select'} = 'SELECT * FROM data';

	# Web URI.
	$self->{'web_uri'} = 'https://morph.io/';

	# Process params.
	set_params($self, @params);

	# Check API key.
	if (! defined $self->{'api_key'}) {
		err "Parameter 'api_key' is required.";
	}

	# Check project.
	if (! defined $self->{'project'}) {
		err "Parameter 'project' is required.";
	}
	if ($self->{'project'} !~ m/\/$/ms) {
		$self->{'project'} .= '/';
	}

	# Web URI.
	if ($self->{'web_uri'} !~ m/\/$/ms) {
		$self->{'web_uri'} .= '/';
	}

	# Object.
	return $self;
}

# Get csv.
sub csv {
	my ($self, $output_file) = @_;
	my $uri = URI->new($self->{'web_uri'}.$self->{'project'}.
		'data.csv?key='.$self->{'api_key'}.'&query='.
		uri_escape($self->{'select'}));
	my $content = get($uri->as_string);
	if (! $content) {
		err "Cannot get '".$uri->as_string."'.";
	}
	barf($output_file, $content);
	return;
}

# Get sqlite file.
sub sqlite {
	my ($self, $path) = @_;
	# TODO
}

1;

__END__
