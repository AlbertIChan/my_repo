#!/usr/bin/env perl
#===============================================================================
#
#         FILE: test_read_file.pl
#
#        USAGE: ./test_read_file.pl  
#
#  DESCRIPTION: Test to read an entire file all at once.
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: CHEN Bei (cb), chenbei102@gmail.com
# ORGANIZATION: Institute of Mechanics, CAS
#      VERSION: 1.0
#      CREATED: 09/05/2017 09:59:45 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
#use utf8;


open my $input, '<', $file or die "can't open $file: $!";
while (<$input>) {
    chomp;
    # do something with $_
    
}
close $input or die "can't close $file: $!";
