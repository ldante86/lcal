#!/usr/bin/perl
#
# SCRIPT: star.pl
# AUTHOR: Luciano D. Cecere
# DATE: 02/01/2018-03:03:47 AM
########################################################################
#
# star.pl - Example for Stardate.pm
# Copyright (C) 2018 Luciano D. Cecere <ldante86@aol.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
########################################################################

use strict;
use warnings;
use 5.010;

use Stardate;

if ( @ARGV and $ARGV[0] eq "-h" or @ARGV > 0 and @ARGV < 3 ) {
    print "Usage: stardate.pl [mm dd yyyy]\n";
    exit(1);
}
elsif ( @ARGV == 3 ) {
    print_stardate(@ARGV);
}
else {
    use POSIX qw(strftime);
    my $month = strftime "%m", localtime;
    my $day   = strftime "%d", localtime;
    my $year  = strftime "%Y", localtime;

    # Only print Captain's Log for current date.
    print_captains_log( $month, $day, $year );
}
