#include <stdio.h>
#include <stdlib.h>

char byte;

void print_banner(void)
{
	char *bannerfile;
	FILE *fp = fopen(NULL==(bannerfile=getenv("BANNERFILE"))?"banner1.txt":bannerfile, "r");
	if (NULL == fp)
	{
		perror("Error opening banner file");
		exit(-1);
	}

	while ((byte = fgetc(fp)) != EOF && ferror(fp) == 0) {
		printf("%c", byte);
	}
	fclose(fp);
}
