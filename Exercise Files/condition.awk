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
