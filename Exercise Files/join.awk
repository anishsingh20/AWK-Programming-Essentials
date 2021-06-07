BEGIN {
	FS="\t";
	OFS="\t";
}

FILENAME == "nameemailavg.csv" {
	split($0, a, ",");
	email = a[2];
	emails[FNR] = email;
	name[email] = a[1];
	average[email] = a[3];
}

FILENAME == "addresses.txt" {
	email = $11;
	address[email] = $4 ", " $5 ", " $7 " " $8;
}

END {
	for ( i in emails ) {
		print name[emails[i]], address[emails[i]], 
			int(average[emails[i]]);
	}
}
