#!/usr/bin/perl
# Perl script to backup all the existing machines
# Author: Aidan Simon
# License: GPL3
# It is assumed you have rsync installed for this to work.
use strict;
use warnings;

# Initial Variables
our @syslist = ();
our $target = 'aidan@192.168.1.235:/home/aidan/Projects/backup';

# Contains a list of systems to back up
our $syslistf = 'syslist.txt';


sub main {
    open(my $fh, '<', $syslistf) or die "Coud not open '$syslistf': $!";

    # Loop through file
    while (my $line = <$fh>) {
	chomp($line); # Remove trailing whitespace
	push(@syslist, $line);
    }

    # Print the systems to be backed up (for debugging)
    print("Will now back up the following machines\n");
    for (@syslist) {
	print;
	print("\n");
    }
    
    # Perform backup
    for (my $i = 0; $i < @syslist; $i += 2) {
	system("rsync", "-avz", $syslist[$i], $target);
    }
}

main();
