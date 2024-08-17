#!/usr/bin/perl
use strict;
use warnings;

# Get input and output file paths from arguments or environment variables
my $input_file  = $ARGV[0] || $ENV{'INDEX_IN'}  || die "No input file provided";
my $output_file = $ARGV[1] || $ENV{'INDEX_OUT'} || die "No output file provided";

# Open the input template file
open(my $fh, '<', $input_file) or die "Could not open file '$input_file' $!";
my $template = do { local $/; <$fh> };
close($fh);

# Prepare to collect matching environment variables
my @services;

# Iterate over the environment variables
foreach my $key (keys %ENV) {
    if ($key =~ /^([A-Z0-9]+)_([A-Z]+)_DSN$/) {
        my $name = '<span class="name">' . $1 . '</span>';
        my $type = '<span class="type">' . lc($2) . '</span>';
        push @services, "$name ($type)";
    }
}

# Determine the replacement text based on the number of services
my $replacement;
if (@services == 0) {
    $replacement = 'I have <span class="count">0</span> service attached :(';
} else {
    my $count = scalar @services;
    $replacement = 'I have <span class="count">' . $count . '</span> service' . ($count == 1 ? '' : 's') . " attached: " . join(', ', @services);
}

# Replace the placeholder in the template
$template =~ s/\@PLACEHOLDER\@/$replacement/;

# Write the updated template to the output file
open(my $out_fh, '>', $output_file) or die "Could not open file '$output_file' $!";
print $out_fh $template;
close($out_fh);

print "Template processing complete. Output written to '$output_file'.\n";
