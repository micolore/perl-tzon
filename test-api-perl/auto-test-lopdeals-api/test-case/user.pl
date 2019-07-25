 #测试用户相关的接口，包括用户登陆相关的接口
 #
 use LWP::UserAgent; 
 my $ua = LWP::UserAgent->new; 
 my $req = HTTP::Request->new('POST' => 'http://192.168.1.5:11521/lopdeals-api/user/members_return_income_rank_list'); 
 $req->content_type('application/x-www-form-urlencoded');#post请求,如果有发送参数，必须要有这句 
 $req->header('Cookie' => "key1=value1;key2=value2"); #如果想发送cookie，则需这句 
 $req->header('Accept-Language' => 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3');#如需发送请求头，  #只需像这行代码一般 
 $req->header("jwt"=>'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiIyMTM4OCIsInN1YiI6IjIwMTktMDctMjUgMDE6NTQ6NDUiLCJpc3MiOiJsb3BkZWFscyIsImlhdCI6MTU2NDAzNDA4NSwiZXhwIjoxNTY0NjM4ODg1fQ.ySsYYp8IRfCL9Goc45gtCqohnRjtDymseT6F9tUpEmc');
 $req->content("");#发送post的参数 
 my $res = $ua->request($req); 
 print $res->status_line."\n"; 
 print $res->as_string();
 #获取的是原始内容，包括响应头，响应正文 
 #$res->content();获取的是响应正文 

 use LWP::UserAgent;
 $ua = LWP::UserAgent->new;
 $ua->agent("$0/0.1 " . $ua->agent);
 # $ua->agent("Mozilla/8.0") # pretend we are very capable browser
 
 $jwt ="eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiIyMTM4OCIsInN1YiI6IjIwMTktMDctMjUgMDE6NTQ6NDUiLCJpc3MiOiJsb3BkZWFscyIsImlhdCI6MTU2NDAzNDA4NSwiZXhwIjoxNTY0NjM4ODg1fQ.ySsYYp8IRfCL9Goc45gtCqohnRjtDymseT6F9tUpEmc";

 # get http send
 $req = HTTP::Request->new(
    GET => 'http://192.168.1.5:11521/lopdeals-api/user/members_return_income_rank_list');
 $req->header('Accept' => 'text/html');
 $req->header("jwt",$jwt); 
 # send request
 $res = $ua->request($req);
 print "分销商排行列表接口\n";
 print $res->decoded_content . "\n";

