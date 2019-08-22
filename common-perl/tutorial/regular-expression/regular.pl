#!/usr/bin/perl

# 三种方式
# 匹配 m// (可以省去m)
# 替换 s///
# 转化 tr///

# 1、匹配操作符

$bar = "I am runoob site . wecolme to ruboob site.";

if($bar =~ /run/){
	print "第一次匹配！\n";
}else{
	print "第一次不匹配! \n";
}

$bar  = "run";

if($bar =~ /run/){
	print  "第二次匹配!\n";
}else{
	print "第二次不匹配！\n";
}

# 2、模式匹配修饰符
# i 忽略大小写
# m 多行模式
# o 仅赋值一次
# s 单行模式
# x 忽略模式空白
# g 全局匹配
# cg  全局匹配失败后，允许再次匹配字符串

# 3、正则表达式变量
# $`: 匹配部分的前一部分字符串
# $&: 匹配的字符串
# $': 还没有匹配的剩余字符串

$string =  "welcome  to runoob site";
$string =~ m/run/;

print "匹配前的字符串:$`\n";
print "匹配的字符串: $&\n";
print "匹配后的字符串:$'\n";


# 4、替换操作符
# s/PATTERN/REPLACEMENT/;

$string2 = "welcome to google site";
$string2 =~ s/google/lopscoop/;

print "$string2\n";

# 5、替换操作修饰符
# i 同上
# m ^开始 $结束
# o 只执行一次
# s 
# x 空白忽略
# g 替换所有匹配
# e 替换字符串为表达式

# 6、转化操作符
# c 转化所有未指定符
# d 删除所有指定符
# s 把多个相同的输成字符缩成一个

$string3 = "welcome to lopscoop site";
$string3 =~ tr/a-z/A-z/;
print "$string3\n";

$string4 = "lopscoop";
$string4 =~ tr/a-z/a-z/s;
print "$string4\n";

#7、more regular 
#. 匹配替换行符以外所有字符
#x? 匹配0次或一次字符串
#x*
#x+
#.*
#.+
#{m}
#{m,n}
#{m,}
#[]
#[^]
#[0-9]
#[a-z]
#[^0-9]
#[^a-z]
#^
#$
#\d
#\d+
#\D
#\D+
#\w
#\w+
#\W
#\W+
#\s
#\s+
#\S
#\S+
#\b
#\B
#a|b|c
#abc
#/patten/i
