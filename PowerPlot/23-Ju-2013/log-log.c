#include<stdio.h>
#include<stdlib.h>
int main( int argc, char * argv[])
{
	if( argc !=3 )
	{
		printf("Execute format : ./program in_file out_file");
		return 0;
	}
	FILE *in_read, *out_write;
	long int prev_time,prev_power,curr_time,curr_power,
		perf_curr_time,initial = 1;
	in_read = fopen(argv[1],"r");
	out_write = fopen(argv[2], "w");
	while(fscanf(in_read,"%ld %ld",&curr_time,&curr_power)!= EOF )
	{
		if( initial == 1 )
		{
//			fprintf(out_write,"%ld %ld\n",curr_time,curr_power);
			prev_time = curr_time;
			prev_power = curr_power;
			initial = 0;
		}
		else
		{
			curr_time += prev_time;
			while( prev_time < curr_time )
			{
				fprintf(out_write,"%ld %ld\n",prev_time,prev_power);
				prev_time ++ ;
			}
			prev_time = curr_time;
                        prev_power = curr_power;
		}
	}
	fprintf(out_write,"%ld %ld\n",prev_time,prev_power);
	return 0;
}
