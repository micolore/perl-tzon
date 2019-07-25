# 包名测试
# 2019-07-25
use strict;

#  为什么 begin&end在perl构建模块时特别有用呢？
BEGIN{
    print("program start....\n");
}

my $i = 10;
print "packname : ",__PACKAGE__, "$i\n";

package mypack;
my $i = 20;
print "packname : ",__PACKAGE__, "$i\n";

package main;
my $i = 200;
print "packname : ",__PACKAGE__, "$i\n";
print "packname : ",__PACKAGE__, "$mypack::i\n";

END{
    print("program end ....\n");
}

# 调用其他的模块中的方法
package Foo;
require Foo;
Foo:bar("a");
Foo:blat("b");
# use
# use Foo;
# bar("a");
# blat("b");
# use编译时加的，默认在INC 与require 运行时加的，可以指定路径
