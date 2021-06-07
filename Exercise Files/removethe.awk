BEGIN { 
	target = "the";
}
{
	s = index($0, target);
	if ( s == 0 ) {
		print;
	} else {
		print substr($0, 1, s-1) substr($0, s + length(target));
	}
}
