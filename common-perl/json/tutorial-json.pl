#!/usr/bin/perl

use JSON;

$utf8_encoded_json_text = encode_json $perl_hash_or_arrayref;
$perl_hash_or_arrayref  = decode_json $utf8_encoded_json_text;

$json = JSON->new->allow_nonref;
$json_text   = $json->encode($perl_scalar);
$perl_scalar = $json->decode($json_text);

