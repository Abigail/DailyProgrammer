#!/opt/perl/bin/perl

use 5.026;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';

use lib ".";
use Test::More;
use Easy;

foreach my $test ([qw [C  Do  C ]],
                  [qw [C  Re  D ]],
                  [qw [C  Mi  E ]],
                  [qw [D  Mi  F#]],
                  [qw [A# Fa  D#]],) {
    my ($scale, $solfege, $note) = @$test;
    is note ( $scale,   $solfege), $note,
      "note ('$scale', '$solfege') eq '$note'";
}


done_testing;

__END__
