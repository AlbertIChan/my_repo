#!/usr/bin/env perl
#===============================================================================
#
#         FILE: test_substitution_var.pl
#
#        USAGE: ./test_substitution_var.pl  
#
#  DESCRIPTION: Test to use a variable in the substitution operator.
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: CHEN Bei (cb), chenbei102@gmail.com
# ORGANIZATION: Institute of Mechanics, CAS
#      VERSION: 1.0
#      CREATED: 09/18/2017 10:56:07 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

my $find = "start (.*) end";
my $replace = '"foo $1 bar"';

my $var = "start middle end";
$var =~ s/$find/$replace/ee;

print "var: $var\n";


