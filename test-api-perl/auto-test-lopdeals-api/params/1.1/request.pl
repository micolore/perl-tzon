#接口地址、参数、返回值校验规则
use strict;
use JSON;

my $params_json = JSON->new->space_after->encode({"a" => "b" });
print "JSON TEST p1....\n";
my $json_obj = decode_json $params_json;
print "params_json: ". $params_json . "\n";
print "json_obj: " . $json_obj . "\n";
print "\"a\": " . $json_obj->{"a"} . "\n";
print " " . $json_obj->{a} . "\n";

print "JSON TEST p2....\n";

my $jwt = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiIyMTM4OCIsInN1YiI6IjIwMTktMDctMjUgMDE6NTQ6NDUiLCJpc3MiOiJsb3BkZWFscyIsImlhdCI6MTU2NDAzNDA4NSwiZXhwIjoxNTY0NjM4ODg1fQ.ySsYYp8IRfCL9Goc45gtCqohnRjtDymseT6F9tUpEmc";

my $reseller_rank_list = JSON->new->space_after->encode({
		"api_url"    => "http://192.168.1.5:11521/lopdeals-api/user/members_return_income_list?page=1&size=2",
		"header_jwt" => $jwt
               	});
my $reseller_rank_list_params_json = decode_json $reseller_rank_list;
print "reseller_rank_list_params_json:api_url" . $reseller_rank_list_params_json->{api_url} . "\n";
print "reseller_rank_list_params_json:header_jwt" . $reseller_rank_list_params_json->{header_jwt} . "\n";




