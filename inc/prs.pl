#!/usr/bin/env perl

use strict;
use warnings;
use feature ':5.10';
use Data::Dump qw( dump );
use lib::abs '../lib';
use Data::Dumper;
use Regexp::IPv6 qw( $IPv6_re );
use Validate::SPF::Parser;

use Regexp::Common qw( net );

use Validate::SPF qw( validate );


my $spf = Validate::SPF::Parser->new;

# my $query = Search->new;

sub sd(@) { say dump @_ }

# sd $spf->parse('v=spf1   ?ptr ptr ~all ?a');
my @spfs = (
    q{v=spf2 a mx -all},
    q{v=spf1   ?ptr ptr ~all:foo.com/23 ?a},
    q{v=spf1 include:_spf.google.com +mx  ?ptr ptr ~all ?a},
    q{v=spf1 ?all:foo.net},
);

for ( @spfs ) {
    say 'SPF: ' . $_;
    sd [ validate( $_ ) ];
    say '';
}


# sd $spf->error;

# sd $spf->parse('v=spf1 include:_spf.google.com +mx  ?ptr ptr ~all ?a');

# sd $spf->error;

# sd $spf->parse('v=spf2 $all');

# sd $spf->error;

# sd $spf->parse('v=spf1 -all ip4:127.0.0.1/32 ?ip4:1.2.3.4 ip6:2a00:f940::37/59 ip4:366.127.0.13 ip6:fe80::1');

# sd $spf->error;

# sd $spf->parse('v=spf1 ip4:127.0.0.1 redirect=foo.example.com exp=www.ru');

# sd $spf->error;

# sd $spf->parse('ip4:192.157.005.0/24');

# sd $spf->error;

# my $hh = '_spf.google.co%%m??';

# if ( $hh =~ m/($RE{net}{domain}{-nospace})/i ) {
#     say $1;
#     say $hh;
#     say $RE{net}{domain}{-nospace};
# }

# my $ip = '234.333.1.1';
# if ( $ip =~ m/($RE{net}{IPv4}{dec})/ ) {
#     say $1;
#     say $ip;
#     say $RE{net}{IPv4}{dec};
# }

# my $ip6 = '2a00:f940::37';

# if ($ip6 =~ /^((\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|($IPv6_re))\b/i ) {
#     say 'mathed: ' . $1;
# }

# say dump $query->parse('aaa or bbb NOT foo AND bar OR quux');

# say dump $query->parse('and not foo and bar');

1;
