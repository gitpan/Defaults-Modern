
use strict;
use warnings;

use 5.014001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Yet another approach to modernistic Perl",
  "AUTHOR" => "Jon Portnoy <avenj\@cobaltirc.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Defaults-Modern",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Defaults::Modern",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Function::Parameters" => "1.0201",
    "Import::Into" => 1,
    "Keyword::Simple" => 0,
    "List::Objects::Types" => 0,
    "List::Objects::WithUtils" => "1.009",
    "Moo" => 1,
    "MooX::late" => "0.014",
    "Path::Tiny" => "0.03",
    "PerlX::Maybe" => 1,
    "Scalar::Util" => 0,
    "Switch::Plain" => 0,
    "Try::Tiny" => 0,
    "Type::Tiny" => "0.022",
    "Types::Path::Tiny" => "0.005",
    "bareword::filehandles" => 0,
    "indirect" => "0.30",
    "match::simple" => "0.004",
    "true" => "0.18"
  },
  "TEST_REQUIRES" => {
    "Test::More" => "0.88"
  },
  "VERSION" => "0.004001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



