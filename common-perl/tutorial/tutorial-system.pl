#!/usr/bin/perl

$PATH = "我时perl的变量";
system('echo $PATH');#作为shell的环境变量
system("echo $PATH");# 作为perl的变量
system("echo \$PATH");#转义

1;
