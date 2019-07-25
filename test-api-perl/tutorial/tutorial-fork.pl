#!/usr/bin/perl

if(!defined($pid = fork()) ){
  die "无法创建子进程: $!";
}elsif($pid == 0){
  print "通过子进程输出\n";	
  exec("date") || die "无法输出日期:$!";
}else{
  print "通过父进程输出\n";
  $ret =waitpid($pid,0);
  print "完成的进程ID: $ret\n";
}
1;
