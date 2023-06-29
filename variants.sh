# Switching the delimiter from / to # for readability. 
git ls-remote --get-url                       \
| sed 's#:[[:digit:]]\+##g'                   \
| sed 's#^ssh://##'                           \
| sed 's#:#\/#g'                              \
| sed 's#^\(http\|https\)\/\/\/#https:\/\/#i' \
| sed 's#^git@#https:\/\/#i'                  \
| sed 's/\.git$//'                            \
| xargs open > /dev/null                      ;

# Convert all sed processes to one process 
git ls-remote --get-url                          \
| sed -e 's#:[[:digit:]]\+##g'                   \
      -e 's#^ssh://##'                           \
      -e 's#:#\/#g'                              \
      -e 's#^\(http\|https\)\/\/\/#https:\/\/#i' \
      -e 's#^git@#https:\/\/#i'                  \
      -e 's/\.git$//'                            \
| xargs open > /dev/null                         ;

# Increase readability by switching to a { block.
git ls-remote --get-url \
| sed '
1,$ {
	s#:[[:digit:]]\+##g;
	s#^ssh://##;
	s#:#\/#g;
	s#^\(http\|https\)\/\/\/#https:\/\/#i;
	s#^git@#https:\/\/#i;
	s/\.git$//;
}' | xargs open > /dev/null;

# Switch to awk. Better readability. Uses ERE instead of BRE.
git ls-remote --get-url \
| awk '
/.*/ { 
	gsub(/:[[:digit:]]+/, ""); 
	sub(/^ssh:\/\//, ""); 
	gsub(/:/, "/"); 
	sub(/^(http|https)\/\/\//, "https://"); 
	sub(/^git@/, "https://");
	sub(/.git$/, "");
	print $0; 
}' | xargs open > /dev/null;
