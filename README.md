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



 ### REGULAR EXPRESSIONS:


	A) awk '$4 ~ /up/{print $0}' dukeofyork.txt  : 4th field contains regular expression pattern /up/

	He marched them up to the top of the hill
	They were neither up nor down



	B) awk '$3 ~ /the/{print}' dukeofyork.txt  : 3rd field matches /the/
	He marched them up to the top of the hill
	And when they were up they were up
	And when they were down they were down
	And when they were only half-way up
	They were neither up nor down



	C) awk '$3 ~ /^the/{print}' dukeofyork.txt  : 3rd field begins with /the/
	He marched them up to the top of the hill
	And when they were up they were up
	And when they were down they were down
	And when they were only half-way up
	
	
	
	D) awk '/a[a-zA-Z]*c/{print $0}' : Match 0 or more occurrences of the char set pattern in between i.e [a-zA-Z]*:

	abbddbBc
	abbddbBc
	abbbbbdssbbC
	abHFYEHSHc
	abHFYEHSHc



	E) awk '/a[a-zA-Z]{3}c/{print $0}': Exactly matches 3 occurrences of the pattern [a-zA-Z] in between:
	abc
	abbc
	aABCc
	aABCc
	aZDbc
	aZDbc
	
	
	
	F) Grouping characters: awk '/(anish){2}[a-z]c/{print $0}'. : Exactly.2 occurrences of pattern (anish):
	anishanishzc
	anishanishzc
	anishbc





### CONTROL STRUCTURES



	A) awk '{ if ( NF < 8) {print "Short Line:", $0 } else { print "Long Line: ", $0 } }' Exercise\ Files/dukeofyork.txt 
	
	
	Short Line: The grand old Duke of York
	Short Line: He had ten thousand men
	Long Line:  He marched them up to the top of the hill
	Short Line: And he marched them down again
	Long Line:  And when they were up they were up
	Long Line:  And when they were down they were down
	Short Line: And when they were only half-way up
	Short Line: They were neither up nor down


	OR We can create an AWK file and add the code inside it using -f flag:
	
	
	awk -f condition.awk dukeofyork.txt 
	
	SHORT LINE: The grand old Duke of York
	SHORT LINE: He had ten thousand men
	LONG LINE: He marched them up to the top of the hill
	SHORT LINE: And he marched them down again
	SHORT LINE: And when they were up they were up
	SHORT LINE: And when they were down they were down
	SHORT LINE: And when they were only half-way up
	SHORT LINE: They were neither up nor down
	

	The AWK File condition.awk:

	{
        	if (NF > 8)
       	 	{	
                	print("LONG LINE:", $0)
        	}
        	else
		{
			print("SHORT LINE:", $0)
		}

	}



	B) FOR LOOP:
	
	{
	        for  ( i = 1 ; i<=3; i++)
	        {
	                print "Line ", NR ",field ", i ": ", $i ;
	        }
	
	}
	
	awk -f forloop.awk dukeofyork.txt 
	
	Line  1,field  1:  The
	Line  1,field  2:  grand
	Line  1,field  3:  old
	Line  2,field  1:  He
	Line  2,field  2:  had
	Line  2,field  3:  ten
	Line  3,field  1:  He
	Line  3,field  2:  marched
	Line  3,field  3:  them
	Line  4,field  1:  And
	Line  4,field  2:  he
	Line  4,field  3:  marched
	Line  5,field  1:  And
	Line  5,field  2:  when
	Line  5,field  3:  they
	Line  6,field  1:  And
	Line  6,field  2:  when
	Line  6,field  3:  they
	Line  7,field  1:  And
	Line  7,field  2:  when
	Line  7,field  3:  they
	Line  8,field  1:  They
	Line  8,field  2:  were
	Line  8,field  3:  neither
	
	
### FORMATTING THER OUTPUT- USING PRINTF

	A) awk -F, '{printf("%s\t%s\t%d\n", $1, $2, $3)}' nameemailavg.csv


	Art Venere	art@venere.org	256
	Lenna Paprocki	lpaprocki@hotmail.com	259
	Donette Foller	donette.foller@cox.net	282
	Simona Morasca	simona@morasca.com	139
	Dominque Dickerson	dominque.dickerson@dickerson.org	167
	Leota Dilliard	leota@hotmail.com	253
	Sage Wieser	sage_wieser@cox.net	155
	Kris Cho	kris@gmail.com	210
	Minna Amigon	minna_amigon@yahoo.com	95
	Abel Maclead	amaclead@gmail.com	225
	Kiley Caldarera	kiley.caldarera@aol.com	172
	Graciela Ruta	gruta@cox.net	202
	Josephine Darakjy	josephine_darakjy@darakjy.org	178
	Cammy Albares	calbares@gmail.com	290
	Mattie Poquette	mattie@aol.com	283
	Meaghan Garufi	meaghan@hotmail.com	227
	Gladys Rim	gladys.rim@rim.org	243
	Yuki Whobrey	yuki_whobrey@aol.com	128
	Fletcher Flosi	fletcher.flosi@yahoo.com	221
	
	
		
	B) Formatting output with width and precision specifiers:

	awk -F, '{printf("%-20s %-35s %3f\n",$1,$2,$3)}' nameemailavg.csv
	
	Art Venere           art@venere.org                      256.623944
	Lenna Paprocki       lpaprocki@hotmail.com               259.688783
	Donette Foller       donette.foller@cox.net              282.329798
	Simona Morasca       simona@morasca.com                  139.519116
	Dominque Dickerson   dominque.dickerson@dickerson.org    167.045198
	Leota Dilliard       leota@hotmail.com                   253.646335
	Sage Wieser          sage_wieser@cox.net                 155.555768
	Kris Cho             kris@gmail.com                      210.794278
	Minna Amigon         minna_amigon@yahoo.com              95.479554
	Abel Maclead         amaclead@gmail.com                  225.774477
	Kiley Caldarera      kiley.caldarera@aol.com             172.957629
	Graciela Ruta        gruta@cox.net                       202.683648
	Josephine Darakjy    josephine_darakjy@darakjy.org       178.877840
	Cammy Albares        calbares@gmail.com                  290.446513
	Mattie Poquette      mattie@aol.com                      283.239952
	Meaghan Garufi       meaghan@hotmail.com                 227.142916
	Gladys Rim           gladys.rim@rim.org                  243.459636	
	Yuki Whobrey         yuki_whobrey@aol.com                128.321717
	
	

	C) Width and precision specifier for decimal values: % <width/length> . <precision/no of digits after decimal>f:

	awk -F, '{printf("%-20s %-35s %6.2f\n",$1,$2,$3)}' nameemailavg.csv
	
	Art Venere           art@venere.org                      256.62
	Lenna Paprocki       lpaprocki@hotmail.com               259.69
	Donette Foller       donette.foller@cox.net              282.33
	Simona Morasca       simona@morasca.com                  139.52
	Dominque Dickerson   dominque.dickerson@dickerson.org    167.05
	Leota Dilliard       leota@hotmail.com                   253.65
	Sage Wieser          sage_wieser@cox.net                 155.56
	Kris Cho             kris@gmail.com                      210.79
	Minna Amigon         minna_amigon@yahoo.com               95.48
	Abel Maclead         amaclead@gmail.com                  225.77
	Kiley Caldarera      kiley.caldarera@aol.com             172.96
	Graciela Ruta        gruta@cox.net                       202.68
	Josephine Darakjy    josephine_darakjy@darakjy.org       178.88
	Cammy Albares        calbares@gmail.com                  290.45
	Mattie Poquette      mattie@aol.com                      283.24
	Meaghan Garufi       meaghan@hotmail.com                 227.14
	Gladys Rim           gladys.rim@rim.org                  243.46
	Yuki Whobrey         yuki_whobrey@aol.com                128.32
	Fletcher Flosi       fletcher.flosi@yahoo.com            221.39



### STRING MANIPULATION USING INBUILD FUNCTIONS

	A) Using sub(/regexp/,<replace_pattern_with>) function to replace a string pattern :

	awk '{sub(/the/,""); print}' dukeofyork.txt 
	
	The grand old Duke of York
	He had ten thousand men
	He marched m up to the top of the hill
	And he marched m down again
	And when y were up they were up
	And when y were down they were down
	And when y were only half-way up
	They were neir up nor down

	B) Another example of using sub() function to replace a string pattern:
	
	awk '{sub(/the[ym]/,"ALL OF THEM"); print}' dukeofyork.txt 
	
	The grand old Duke of York
	He had ten thousand men
	He marched ALL OF THEM up to the top of the hill
	And he marched ALL OF THEM down again
	And when ALL OF THEM were up they were up
	And when ALL OF THEM were down they were down
	And when ALL OF THEM were only half-way up


	C) Gsub: Global changing of all matching patterns everywhere in the input:

	awk '{gsub(/the[ym]/,"ALL OF THEM"); print}' dukeofyork.txt 

	The grand old Duke of York
	He had ten thousand men
	He marched ALL OF THEM up to the top of the hill
	And he marched ALL OF THEM down again
	And when ALL OF THEM were up ALL OF THEM were up
	And when ALL OF THEM were down ALL OF THEM were down
	And when ALL OF THEM were only half-way up
	They were neither up nor down
