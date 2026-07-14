# A Simple script to start TOPS-20 using the klh10 emulator.
# Author: Aidan Simon
# License: GPL3
# It is assumed that you have at least klh10, tmux, and expect alongside Perl for this to work.
use strict;
use warnings;

use Expect;

# Initial Params
my $startScript = "/root/dec20/klt20"


# Create expect object
my $exp = Expect->spawn("sh", $startScript)
    or die "Cannot spawn sh $!\n";

# Test behavior
$exp->send("hello\n");

$exp->soft_close();
