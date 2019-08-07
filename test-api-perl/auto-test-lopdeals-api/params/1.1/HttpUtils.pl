#!/usr/bin/perl

use LWP::UserAgent;
use JSON;
use Scalar::Util qw(reftype);

my $headers = JSON->new->space_after->encode({"jwt"=>"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiIyMTQ2OCIsInN1YiI6IjIwMTktMDctMzAgMDU6MTg6NTYiLCJpc3MiOiJsb3BkZWFscyIsImlhdCI6MTU2NDQ3ODMzNiwiZXhwIjoxNTY1MDgzMTM2fQ.zz0-itlKAuBVKAbWa97Xhu0DPnCmLE08f0Zury52viA"});
my $headers_json = decode_json $headers;

sub http_get(){

	$ua = LWP::UserAgent->new;
	$ua ->agent("$0/0.1" . $ua->agent);

	$req = HTTP::Request->new(
		GET => 'http://192.168.1.5:11521/lopdeals-api/order/list'
	);
	$req->header("Agent"=>'text/html');
	$req->header("jwt"=>$headers_json->{"jwt"});
	#print $headers_json->{"jwt"} . "\n";
	$res = $ua->request($req);
	my $result =decode_json  $res->decoded_content;
	print "接口状态:   " . $result->{"code"} . "\n";
	print "接口返回值: " . $result->{"data"} . "\n";
	print "message:    " . $result->{"message"} . "\n";
}
#http_get();

my $post_params = JSON->new->space_after->encode({"url"=>"http://192.168.1.153:11521/lopdeals-api/user/bind_paytm"});
my $post_params_json = decode_json $post_params;

my $post_params_data = JSON->new->space_after->encode({
	    "id"=>"1"
	});
my $post_params_data_json = decode_json $post_params_data;

# post contenttype=application/json
sub http_post_json(){
   my $ua = LWP::UserAgent->new;
   print "params: " . $post_params_json->{"url"} . "\n"; 

   print "params data: " . $post_params_data_json->{"id"} . "\n"; 
   my $req = HTTP::Request->new('POST' => $post_params_json->{"url"}); 
   $req->content_type('application/json;charset=utf-8'); 
   $req->header('Cookie' => "key1=value1;key2=value2"); #如果想发送cookie，则需这句 
   $req->header("jwt"=>$headers_json->{"jwt"});
   $req->header('Accept-Language' => 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3');#如需发送请求头，  #只需像这行代码一般 
   $req->content($post_params_data);#发送post的参数,如果是application/json的直接发送字符串即可 
   my $res = $ua->request($req); 
   print $res->status_line."\n"; 
   #print $res->as_string();#获取的是原始内容，包括响应头，响应正文 
   #$res->content();获取的是响应正文  
   my $result =decode_json  $res->decoded_content;
   print "接口返回code:   " . $result->{"code"} . "\n";	
   print "接口返回message:    " . $result->{"message"} . "\n";
   print "接口接口data: " . $result->{"data"} . "\n";
}
#http_post_json();

my $post_params_form = JSON->new->space_after->encode({
		"url"=>"http://192.168.1.153:11521/lopdeals-api/user/bind_paytm",
		"form_data"=>"paytm=123&pwd=456"
	}
      );
my $post_params_forms_json  =  decode_json $post_params_form;

# post content-type=application/x-www-forms-urlencoded
# 参数是字符串类型的
sub http_post_form{

       print @_ . "\n";
       ($form_data_json_params) =  @_;
       my $form_data_json  =  decode_json  $form_data_json_params;
       print "api-full-data   :" . $form_data_json          . "\n";
       print "api-form-data   :" . $form_data_json->{"data"} . "\n"; 
       print "api-request-url :" . $form_data_json->{"url"} . "\n";
       my $ua = LWP::UserAgent->new;
       my $req = HTTP::Request->new('POST' =>$form_data_json->{"url"});

       $req->content_type('application/x-www-form-urlencoded');#post请求,如果有发送参数，必须要有这句
       $req->header('Cookie' => "key1=value1;key2=value2"); #如果想发送cookie，则需这句
       $req->header('Accept-Language' => 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3');#如需发送请求头，  #只需像这行代码一般
       $req->header('jwt'=>$headers_json->{"jwt"});
       $req->content($form_data_json->{"form_data"});#发送post的参数

       #$req->content("paytm=123");不能设置两遍content
       #$req->content("pwd=346");
       my $res = $ua->request($req);
       #print $res->as_string();#获取的是原始内容，包括响应头，响应正文
       #$res->content();获取的是响应正文
       
       #返回值相关数据
       my $result = decode_json  $res->decoded_content;
       print "接口状态:   " . $result->{"code"} . "\n";	
       print "接口返回值: " . $result->{"data"} . "\n";
       print "message:    " . $result->{"message"} . "\n";
       return $result->{"data"};
}

my $common_domain_name = "http://192.168.1.207:11521/lopdeals-api/";

#注册接口参数
my $register_params_json_str = JSON->new->space_after->encode({
	       "url"=>$common_domain_name . "user/register",
               "form_data"=>"mobile=1991111120&password=123456&enabled_sms=1&sms_code=123456"
	});
#请求验证码接口参数
$send_sms_code_url =$common_domain_name . "common/send_sms_code";
my $send_sms_code_json_str = JSON->new->space_after->encode({
	       "url"=> $send_sms_code_url,
	       "form_data"=>"mobile=1991111120&type=1"
	});

# 注册接口请求
my $result = http_post_form($send_sms_code_json_str);
print "http-result-data:" . $result . "\n";
http_post_form($register_params_json_str);

