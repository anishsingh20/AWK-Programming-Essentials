	BEGIN {
		FS="\t";
		print "<table>";
		print "<tr>";
		print "\t<th>Bowler</th>";
		for ( i=1; i<=7; i++ ) {
			print "\t<th>Round " i "</th>";
		}
		print "</tr>";
	}

	{
		print "<tr>";
		print "\t<td><b>" $1 "</b></td>";
		for ( i=2; i<=8; i++ ) {
			print "\t<td>" $i "</td>";
			total[i] += $i;
		}
		print "</tr>";
	}

	END {
		print "<tr>";
		print "\t<td><b><i>Average</i></b></td>";
		for ( i=2; i<=8; i++ ) {
			print "\t<td><i>" int(total[i] / NR) "</i></td>";
		}
		print "</tr>";
		print "</table>";
	}
