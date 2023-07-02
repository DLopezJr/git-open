#!/bin/sh

git ls-remote --get-url \
| awk '
($0 ~ /.*/) { 
	gsub(/:[[:digit:]]+/, ""); 
	sub(/^ssh:\/\//, ""); 
	gsub(/:/, "/"); 
	sub(/^(http|https)\/\/\//, "https://"); 
	sub(/^git@/, "https://");
	sub(/.git$/, "");
	print $0; 
}' | xargs open > /dev/null;
