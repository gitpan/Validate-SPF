#!/usr/bin/env perl

use strict;
use warnings;
use feature ':5.10';
use Data::Dump qw( dump );
use lib::abs qw( ./lib );
use Validate::SPF qw( validate );

# my $spf_string = q{v=spf1  redirect=Example.com   +a  ?a/25   mx include:_spf.google.com  -naptr/24 -a:10.10.1.2/23 ?srv/24 ?exp=asas ~all};
# my $spf_string = q{v=spf1 redirect=Example.com   exp=Foo.Example.NET ?exp=asas};
# my $spf_string = q{v=spf1 ?ip4:10.1.1.1 -ip4:10.20.1.0/23 +ip4:127.1.1.0/33 ip4:192.157.005.0/24 ip4:100.2.300.1};
# my $spf_string = q{?ip4:10.1.1.1 -ip4:10.20.1.0/23};

# ip4:<ip4-address>
# ip4:<ip4-network>/<prefix-length>

# ip6:<ip6-address>
# ip6:<ip6-network>/<prefix-length>

# a
# a/<prefix-length>
# a:<domain>
# a:<domain>/<prefix-length>

# mx
# mx/<prefix-length>
# mx:<domain>
# mx:<domain>/<prefix-length>

# ptr
# ptr:<domain>

# exists:<domain>

# include:<domain>

# redirect=<domain>

# exp=<domain>


say dump ( validate( $spf_string ) );

1;
