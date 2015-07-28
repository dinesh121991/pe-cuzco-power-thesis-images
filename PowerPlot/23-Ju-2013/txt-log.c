#include<stdio.h>
#include<stdlib.h>
#define LINE_MAX 1000
int main( int argc, char * argv[])
{
	FILE *in_read, *out_write;
	long int prev_time,prev_power,curr_time,curr_power,
		perf_curr_time,initial = 1;
	in_read = fopen("s.conf","r");
	if( in_read == NULL )
	{
		printf("File was not opened");
		return -1 ;
		//ext(EXIT_FAILURE);
	}
//	out_write = fopen(argv[2], "w");
	char *str,s1[100],s2[100];
	char c;
	char buf[LINE_MAX];
	long int i1,i2;
	ssize_t read ;
	size_t len = 0;
	char *line = NULL ;
	while(fscanf(in_read,"%s  %ld  %s %ld",s1,&curr_power,s2,&curr_time)!= EOF )
	{
		printf("%ld %ld \n",curr_power,curr_time);
		fprintf(out_write,"%ld %ld\n",curr_time,curr_power);
	} 
/*	while ((read = getline(&line, &len, in_read)) != -1) 
	{
		if (sscanf(buf, "%s %ld %s %ld", s1,&i1,s2,&i2) < 9)
		{
		    // there weren't 9 items to convert, so try to read 8 of them only
			printf("%ld %ld \n",i1,i2);
		}
	    // process line here
	}
*/
	fclose(in_read);
	if (line)
        	free(line);
	return 0;
}
