{
	for ( i=1; i<=NF; i++ ) {
		a[NR ":" i] = $i;
	}
	if ( NF > maxNF ) {
		maxNF = NF;
	}
}

END {
	for ( field=1; field<=maxNF; field++ ) {
		for ( rec=1; rec<=NR; rec++ ) {
			printf ( "%-10s", a[rec ":" field] );
		}
		printf("\n");
	}
}
