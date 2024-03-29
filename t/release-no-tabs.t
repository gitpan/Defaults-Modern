
BEGIN {
  unless ($ENV{RELEASE_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for release candidate testing');
  }
}

use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::NoTabsTests 0.08

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/Defaults/Modern.pm',
    'lib/Defaults/Modern/Define.pm',
    't/00-report-prereqs.t',
    't/inc/PkgTrue.pm',
    't/inc/TypeLib.pm',
    't/modern.t',
    't/release-cpan-changes.t',
    't/release-dist-manifest.t',
    't/release-no-tabs.t',
    't/release-pod-coverage.t',
    't/release-pod-linkcheck.t',
    't/release-pod-syntax.t',
    't/release-unused-vars.t'
);

notabs_ok($_) foreach @files;
done_testing;
