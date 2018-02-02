#!/usr/bin/perl

# Script: stardate.pl
# Author: Luciano D. Cecere
# Year: 2018
# License: GPLv2

# This script converts a Gregorian date to Star Trek's Stardate.

use strict;
use warnings;
use 5.010;
use POSIX qw(strftime);

my @months       = qw( Jan Feb Mar Apr May Jun Jul Aug Sept Oct Nov Dec );
my @month_length = ();
my $year_len;

my $month = strftime "%m", localtime;
my $day   = strftime "%d", localtime;
my $year  = strftime "%Y", localtime;

# Starting date is based on Star Trek: The Next Generation, Gregorian
# year 2323.
my $b = 2323;
my $c = 00000.00;

sub month_array {
    my $y = $_[0];
    if ( ( $y % 4 == 0 and $y % 100 != 0 ) or $y % 400 == 0 ) {
        @month_length = qw( 31 29 31 30 31 30 31 31 30 31 30 31 );
        $year_len     = 366;
    }
    else {
        @month_length = qw( 31 28 31 30 31 30 31 31 30 31 30 31 );
        $year_len     = 365;
    }
}

sub gregorian_to_stardate {
    my ( $month, $day, $year ) = @_;
    my %mon = ();

    month_array($year);

    my $len = 0;
    my $x   = 1;
    $mon{0} = 0;
    foreach my $m (@month_length) {
        $mon{$x} = $len += $m;
        $x++;
    }

    my $stardate =
      $c +
      ( 1000 * ( $year - $b ) ) +
      ( ( 1000 / $year_len ) * ( $mon{ $month - 1 } + $day - 1 ) );

    $stardate = sprintf( "%.2f", $stardate );

    print "Captain\'s log, stardate $stardate\n";

}

if ( @ARGV and @ARGV % 3 == 0 ) {
    gregorian_to_stardate(@ARGV);
}
elsif ( @ARGV and @ARGV % 3 != 0 ) {
    die "Usage: stardate.pl month day year\n";
}
elsif ( not @ARGV ) {
    gregorian_to_stardate( $month, $day, $year );
}
