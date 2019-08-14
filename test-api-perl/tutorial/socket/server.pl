#!/usr/bin/perl

use Socket;

#socket(SOCKET,PF_LINT,SOCK_STREAM,(getprotobyname('tcp'))[2]);
#bind(SOCKET,ADDRESS);

#$port = 10001;
#$server_id_address = "192.168.1.105";
#bind(SOCKET,pack_sockaddr_in($port,inet_aton($server_id_address))) or die "无法绑定端口!\n";

#listen(SOCKET,QUEUESIZE);
#accept(NEW_SOCKET,SOCKET);

#while(1){
#	accept(NEW_SOCKET,SOCK);
#}

use strict;
use Socket;

my $port = shift || 10001;
my $proto = getprotobyname('tcp');
my $server = "localhost";

socket(SOCKET,PF_INET,SOCK_STREAM,$proto)
   or die "无法打开 socket $!\n";

setsockopt(SOCKET,SOL_SOCKET,SO_REUSEADDR,1)
   or die "无法SO_REUSEADDR $!\n";

bind(SOCKET,pack_sockaddr_in($port,inet_aton($server)))
   or die "无法绑定端口 $port! \n";

listen(SOCKET,5) or die "listen:$!\n";

print "访问启动！$port\n";

my $client_addr;
while($client_addr = accept(NEW_SOCKET,SOCKET)){
	
	my $name  =  gethostbyaddr($client_addr,AF_INET);
	print NEW_SOCKET "我是来自服务器的消息！";
	print "collection reicieved form $name\n";
	close NEW_SOCKET;
}


