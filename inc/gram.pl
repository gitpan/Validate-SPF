#!/usr/bin/env perl

use strict;
use warnings;
use feature ':5.10';
use Pegex;
use Data::Dump qw( dump );

my $grammar = qq{
%grammar spf
%version 1

spf:
    spf_version
    <BLANK>+
    (
        spf_mechanism* |
        spf_modifier*
    )

spf_version: / ( 'v' <EQUAL> 'spf1' ) /

spf_mechanism: (
    qualifier?
    mechanism_token
)

qualifier: /
    <PLUS> <DASH> <TILDE> <QMARK>
/

mech_a: /
   'a'
   ( a_opts? )
/

a_opts: / ( <DIGIT>+ ) /


mechanism_token: /
    ( 'all' | 'ip4' | 'ip6' | mech_a | 'mx' | 'ptr' | 'exists' | 'include' )
/

};

say dump pegex( $grammar )->parse( 'v=spf1    a23' );


1;
