awk '{ 
	if ( NF<8 ) {
		print "Short line:", $0 
	} else { 
		print "Long line:", $0 
	} 
}' dukeofyork.txt
