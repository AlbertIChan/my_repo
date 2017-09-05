#!/usr/bin/env perl
#===============================================================================
#
#         FILE: test_default_val.pl
#
#        USAGE: ./test_default_val.pl  
#
#  DESCRIPTION: Test some way to set default values for subs.
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: CHEN Bei (cb), chenbei102@gmail.com
# ORGANIZATION: Institute of Mechanics, CAS
#      VERSION: 1.0
#      CREATED: 09/05/2017 03:12:00 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
#use utf8;
use Data::Dumper;


print fun() . "\n";
print fun(1) . "\n";

my @tmp_arary;
@tmp_arary = fun_array(1);
print Dumper(\@tmp_arary) . "\n";
@tmp_arary = fun_array(1, ['a', 'b']);
print Dumper(\@tmp_arary) . "\n";

my %tmp_hash;
%tmp_hash = fun_hash(cmd => 'send', to => 'server');
print Dumper(\%tmp_hash);
%tmp_hash = fun_hash(cmd => 'copy');
print Dumper(\%tmp_hash);


sub fun {
    my	( $par1, $other_pars )	= @_;
    $par1	//= "default_value";
    return $par1;
} ## --- end sub fun

sub fun_array {
    my	( $par1, $other_pars )	= @_;
    $other_pars //= [];
    return $other_pars;
} ## --- end sub fun_array

sub fun_hash {
    my	%default	= (
	from => 'local',
	to => 'remote',
	);

    my	( %par1 )	= (%default, @_);
    return %par1;
} ## --- end sub fun_hash
