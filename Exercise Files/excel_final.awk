BEGIN { RS="\r" }
{ 
	while ( $NF ~ /^".*[^"]$/ ) { 
		getline x; 
		$0 = $0 "\n" x
	}
	for ( i=1; i<=3; i++ ) { 
		gsub("^\"|\"$", "", $i); 
		gsub("\"\"", "\"", $i);
	}
	print "!" $1 "!" $2 "!" $3 "!" 
}

