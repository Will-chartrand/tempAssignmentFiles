#include <stdio.h>
#include <stdlib.h>

char *line;

void print_banner(void)
{
	FILE *stream;
	char *bannerfile;
	size_t r, n = 0;

	stream = fopen(NULL==(bannerfile=getenv("BANNERFILE"))?"banner1.txt":bannerfile, "r");
	if (!stream)
	{
		perror("Error opening banner file");
		exit(-1);
	}

	while (1)
	{
		r = getline(&line, &n, stream);
		if (EOF == r)
		{
			if(line)
				free(line);
			break;
		}
		printf("%s", line);
	}

	fclose(stream);

}
