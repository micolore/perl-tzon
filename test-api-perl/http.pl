use LWP::UserAgent;

$ua =LWP::UserAgent->new;
$ua->agent("$0/0.1 " . $ua->agent);

$req=HTTP::Request->new(
	GET => 'http://192.168.1.105:8080/api/report/businessData/complexBusinessTrendEnterpriseCountChart?dept_type=3');

$req->header('Accept' => 'text/html');

$res =$ua->request($req);

print $res->decoded_content . "\n";

