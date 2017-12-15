package Easy;

use 5.026;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';

# 
# BACKGROUND
# 
# For the purpose of this challenge, the 12 musical notes in the
# chromatic scale are named:
# 
#     C  C#  D  D#  E  F  F#  G  G#  A  A#  B
# 
# The interval between each pair of notes is called a semitone, and
# the sequence wraps around. So for instance, E is 1 semitone above
# D#, C is 1 semitone above B, F# is 4 semitones above D, and C# is
# 10 semitones above D#. (This also means that every note is 12
# semitones above itself.)
# 
# A major scale comprises 7 out of the 12 notes in the chromatic
# scale. There are 12 different major scales, one for each note. For
# instance, the D major scale comprises these 7 notes:
# 
#     D  E  F#  G  A  B  C#
# 
# The notes in a major scale are the notes that are 0, 2, 4, 5, 7,
# 9, and 11 semitones above the note that the scale is named after.
# In the movable do solfège system, these are referred to by the names
# Do, Re, Mi, Fa, So, La, and Ti, respectively. So for instance, Mi
# in the D major scale is F#, because F# is 4 semitones above D.
# 
# (In general, a note can have more than one name. For instance A#
# is also known as Bb. Depending on the context, one or the other
# name is more appropriate. You'd never hear it referred to as the
# A# major scale in real music. Instead it would be called Bb major.
# Don't worry about that for this challenge. Just always use the names
# of the notes given above.)
# 
# CHALLENGE
#
# Write a function that takes the name of a major scale and the solfège
# name of a note, and returns the corresponding note in that scale.
# 
# EXAMPLES
# 
#     note("C", "Do") -> "C"
#     note("C", "Re") -> "D"
#     note("C", "Mi") -> "E"
#     note("D", "Mi") -> "F#"
#     note("A#", "Fa") -> "D#"
#

use Exporter ();
our @ISA    = qw [Exporter];
our @EXPORT = qw [note];


sub note ($scale, $solfege) {
    #
    # The notes.
    #
    state $notes         = [qw [C C# D D# E F F# G G# A A# B]];
    state $solfeges      = [qw [Do Re Mi Fa So La Ti]];
    state $scale_indices = [0, 2, 4, 5, 7, 8, 11];

    #
    # Map notes and solfeges to their index.
    #
    state $index_note    = {do {my $i = 0; map {$_ => $i ++} @$notes}};
    state $index_solfege = {do {my $i = 0; map {$_ => $i ++} @$solfeges}};

    #
    # Start of the scale
    #
    my $scale_start    = $$index_note {$scale};

    #
    # Index in the scale
    #
    my $solfege_offset = $$index_solfege {$solfege};

    #
    # Index of the target note
    #
    my $index_target = $scale_start + $$scale_indices [$solfege_offset];

    #
    # And the note, wrapped around
    #
    $$notes [$index_target % @$notes];
}


1;

__END__
