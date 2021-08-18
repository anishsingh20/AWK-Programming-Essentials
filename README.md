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




