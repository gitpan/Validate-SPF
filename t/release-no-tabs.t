
BEGIN {
  unless ($ENV{RELEASE_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for release candidate testing');
  }
}

use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.08

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/Validate/SPF.pm',
    'lib/Validate/SPF/Parser.pm',
    't/00-compile.t',
    't/01-parser.t',
    't/01-parser__mech-a.t',
    't/01-parser__mech-all.t',
    't/01-parser__mech-exists.t',
    't/01-parser__mech-include.t',
    't/01-parser__mech-ip4.t',
    't/01-parser__mech-ip6.t',
    't/01-parser__mech-mx.t',
    't/01-parser__mech-ptr.t',
    't/01-parser__version.t',
    't/author-test-eol.t',
    't/mechanism.pl',
    't/release-distmeta.t',
    't/release-kwalitee.t',
    't/release-no-tabs.t',
    't/release-pod-coverage.t',
    't/release-pod-syntax.t',
    't/release-test-version.t'
);

notabs_ok($_) foreach @files;
done_testing;
