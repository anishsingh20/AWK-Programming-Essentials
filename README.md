# AWK-Programming-Essentials


### Learning objectives

1. Determine what AWK is.
2. Recognize how to write an AWK program.
3. Determine how to use AWK command-line flags.
4. Identify how to specify field and record separators with variables.
5. Distinguish how to change a CVS file to a tab-separated one.
6. Break down how to work with operators and arrays.
7. Discover how to format output.
8. Interpret how to string data with functions.




### COMMANDS



	1) Multiple patterns and actions:
	
    awk '/up/{print "UP: " NF, $0} /down/{print "DOWN: ", NF, $0} ' dukeofyork.txt


	
	2) Specify regular expression as a field separator:
    awk -F '[,!]' '{print NR,$2}'
    
    
    
	3) Record and field separators:
	
  	awk 'BEGIN{FS=","; RS="!"}{print $3}' onebigline.txt 



	4) awk 'BEGIN{RS=""; FS="\n"} {name=$1; address=$2; statezip=$3}{print name", " address ", " statezip}' multiaddress.txt 




### OUTPUT FIELD SEPARATORS AND OUTPUT RECORD SEPARATORS


	1) awk 'BEGIN{FS=","; OFS="\t"} {print $1, $2, $3} ' nameemailavg.csv
	Art Venere art@venere.org 256.62394383
	Lenna Paprocki lpaprocki@hotmail.com 259.688783099
	Donette Foller donette.foller@cox.net 282.32979844
	Simona Morasca simona@morasca.com 139.51911647
	Dominque Dickerson dominque.dickerson@dickerson.org 167.045197551
	Leota Dilliard leota@hotmail.com 253.646335223
	Sage Wieser sage_wieser@cox.net 155.55576823
	Kris Cho kris@gmail.com 210.794277775
	Minna Amigon minna_amigon@yahoo.com 95.47955397
	Abel Maclead amaclead@gmail.com 225.774477397
	Kiley Caldarera kiley.caldarera@aol.com 172.957628871
	Graciela Ruta gruta@cox.net 202.68364784
	Josephine Darakjy josephine_darakjy@darakjy.org 178.877840188
	Cammy Albares calbares@gmail.com 290.446513401
	Mattie Poquette mattie@aol.com 283.23995223
	Meaghan Garufi meaghan@hotmail.com 227.142916195
	Gladys Rim gladys.rim@rim.org 243.459635712
	Yuki Whobrey yuki_whobrey@aol.com 128.321717297
	Fletcher Flosi fletcher.flosi@yahoo.com 221.394141603


OR 

	2) awk -F, '{print $1 "\t" $2 "\t" $3}' nameemailavg.csv 

