package Stardate;

use 5.022001;
use strict;
use warnings;
use POSIX qw(strftime);

require Exporter;

our @ISA = qw(Exporter);

our @EXPORT = qw(
  print_stardate
  print_captains_log

);

our $VERSION = '0.01';

our $month = strftime "%m", localtime;
our $day   = strftime "%d", localtime;
our $year  = strftime "%Y", localtime;

our @months       = qw( Jan Feb Mar Apr May Jun Jul Aug Sept Oct Nov Dec );
our @month_length = ();
our $year_len;

our $b = 2323;
our $c = 00000.00;

sub month_array {
    our $y = $_[0];
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
    our ( $month, $day, $year ) = @_;
    our %mon = ();

    month_array($year);

    our $len = 0;
    our $x   = 1;
    $mon{0} = 0;
    foreach my $m (@month_length) {
        $mon{$x} = $len += $m;
        $x++;
    }

    our $stardate =
      $c +
      ( 1000 * ( $year - $b ) ) +
      ( ( 1000 / $year_len ) * ( $mon{ $month - 1 } + $day - 1 ) );

    $stardate = sprintf( "%.2f", $stardate );
}

sub print_stardate {
    our ( $month, $day, $year ) = @_;
    print gregorian_to_stardate( $month, $day, $year ) . "\n";
}

sub print_captains_log {
    our ( $month, $day, $year ) = @_;
    print "Captain\'s log, stardate ";
    print gregorian_to_stardate( $month, $day, $year ) . "\n";
}

1;
__END__
