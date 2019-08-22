use strict;
use warnings;

#必须先进行声明测试用例的个数
use Test::Simple tests =>3;
use Hello; #what you're testing

my $hellostr = Hello::hello('hello guys');
my $byestr = Hello::bye('guys bye');
ok($hellostr eq 'Hello Guys!','hello() works');
ok($byestr eq 'GoodsBye Guys!','bye() works');
my $helloworld = Hello::hello();
ok($helloworld eq 'Hello world','should be hello ,world by default');
my $my_goods = 124;
print "hello_goods" . $my_goods . "\n";
