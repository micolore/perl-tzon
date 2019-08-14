#!/usr/bin/perl

use strict;
use DBI;
 
my $host = "192.168.1.5";         # 主机地址
my $driver = "mysql";           # 接口类型 默认为 localhost
my $database = "lopscoop";        # 数据库
# 驱动程序对象的句柄
my $dsn = "DBI:$driver:database=$database:$host";  
my $userid = "root";            # 数据库用户名
my $password = "123Moppo!@#";        # 数据库密码
 
# 连接数据库
my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
#查询英语频道的内容展示、分享数量
my $sth = $dbh->prepare("select sum(read_count) read_count ,sum(share_count) share_count ,date_format(time,'%Y-%m') time from view_language_count where language_type=1 group by date_format(time,'%Y-%m');
");   # 预处理 SQL  语句

$sth->execute();    # 执行 SQL 操作
 
# 注释这部分使用的是绑定值操作
# $alexa = 20;
# my $sth = $dbh->prepare("SELECT name, url
#                        FROM Websites
#                        WHERE alexa > ?");
# $sth->execute( $alexa ) or die $DBI::errstr;
 
# 循环输出所有数据
while ( my @row = $sth->fetchrow_array() )
{
       print join('\t', @row)."\n";
}
 
$sth->finish();
$dbh->disconnect();


sub(){


}
