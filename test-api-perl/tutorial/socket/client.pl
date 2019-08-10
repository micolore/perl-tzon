#!/usr/bin/perl

#connect(SOCKET,ADDRESS);
#$port = 10001;
#$server_ip_address ="192.168.1.5";
#connect(SOCKET,pack_sockaddr_in($port,inte_aton($server_ip_address))) or die "无法绑定端口！\n";

use strict;
use Socket;

my $host  = shift || 'localhost';
my $port  = shift || 10001;
my $server = "localhost";

socket(SOCKET,PF_INET,SOCK_STREAM,(getprotobyname('tcp'))[2])
   or die "无法连接:port $port!\n";
connect(SOCKET,pack_sockaddr_in($port,inet_aton($server)))
   or die "无法连接:port $port!\n";
my $line;
while ($line = <SOCKET>){
	print "$line\n";
}
close SOCKET or die "close: $!";


