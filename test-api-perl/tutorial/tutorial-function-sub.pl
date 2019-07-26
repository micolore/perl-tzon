#!/usr/bin/perl

#use strict;

sub avg{

   my  $n = scalar(@_);
   my  $sum = 0;
   foreach my $item (@_){
   	$sum += $item;
   }   
   my $average = $sum/$n;
   print 'input params:',"@_\n";
   print "first param: $_[0]\n";
   print "params avg: $average\n";
}
avg(10,20,30);

sub PrintList{
    my @list = @_;
    print "list:  @list \n";
}
my $a = 10;
my @b = {1,2,3,4};
PrintList($a,@b);

sub PrintHash{
   my (%hash) = @_;
   foreach my $key(keys %hash){
      my $value = $hash{$key};
      print "$key : $value\n";
   }
}
my %hash = ('name'=> 'perl','age'=>20);
PrintHash(%hash);

#这种不按照形参进行占位的方式，感觉是很别扭
sub add_a_b{
	@_[0]+@_[1];
  	#return @_[0] + @_[1];
}

print "aad_a_b:  " .  add_a_b(10,13) . "\n";

$string = "hello world";


sub PrintA {
	local $string;
	$string = " hello A";
	PrintB();
	print "printA : $string\n";
}

sub PrintB{
        print "PrintB : $string\n";
}
sub PrintC{
	print "printC : $string\n";
}
PrintA();
PrintC();

# 词法变量 静态变量
use feature 'state';

sub PrintCount{
	state $count = 0;
	print "counter : $count\n";
	$count++;
}
for(1..5){
	PrintCount();
}

my $datestring = localtime(time);
print $datestring;
print "\n";




