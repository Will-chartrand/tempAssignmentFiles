/* 3000testui.c */
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#ifdef __linux__
#include <dlfcn.h>
#include <unistd.h>
#include <ncurses.h>
#elif _WIN32
#include <windows.h>
#endif

#define ENTER 10
#define KEY_ESCAPE 27

void (*p_b)(void);
extern int execvpe(const char *file, char *const argv[], char *const envp[]);
extern char **environ;

char *options[] = {
	"Run 3000shell",
	"Run bash",
	"Clear screen",
	"Exit"
};

char *program;

int main()
{
#ifdef __linux__
        void *h;
        h = dlopen ("lib3000banner.so", RTLD_LAZY);
        if (!h)
        {
                printf(dlerror(), stderr);
                exit(-1);
        }
        p_b = dlsym(h, "print_banner");
        if (!p_b)
        {
                printf(dlerror(), stderr);
                exit(-1);
        }
#elif _WIN32
	HANDLE h;
	h = LoadLibrary("3000banner_win.dll");
        if (!h)
        {
                printf("Error loading shared library: %d\n", GetLastError());
                exit(-1);
        }
	p_b = (void (*)(void))GetProcAddress(h, "print_banner");
        if (!p_b)
        {
                printf("Error finding function: %d\n", GetLastError());
                exit(-1);
        }
#endif

        p_b();

#ifdef __linux__
        dlclose(h);

	printf("Press any key to continue...\n");
	getchar();
	initscr();          /* Start curses mode */
	curs_set(0);
        noecho();
        
	start_color();
        init_pair(1, COLOR_WHITE, COLOR_BLUE);
        init_pair(2, COLOR_BLUE, COLOR_WHITE);

	int i, key, selected = 0;
	WINDOW **items;
	items = (WINDOW **)malloc(5 * sizeof(WINDOW *));

	items[0] = newwin(8, 19, 1, 1);
	wbkgd(items[0], COLOR_PAIR(1));
	box(items[0], ACS_VLINE, ACS_HLINE);
	items[1] = subwin(items[0], 1, 14, 2, 3);
	items[2] = subwin(items[0], 1, 14, 3, 3);	
	items[3] = subwin(items[0], 1, 14, 4, 3);
	items[4] = subwin(items[0], 1, 14, 5, 3);
	for (i = 1; i<5; i++)
		wprintw(items[i], "%s", options[i - 1]);
	wbkgd(items[1], COLOR_PAIR(2));
	wrefresh(items[1]);
	keypad(items[0], TRUE);

	while(1) {
		key = wgetch(items[0]);
		wbkgd(items[selected + 1], COLOR_PAIR(1));
		wrefresh(items[selected + 1]);

		if (key == KEY_DOWN) 
			selected = selected==3?0:selected+1;
		else if (key == KEY_UP) 
			selected = selected==0?3:selected-1;
		else if (key == KEY_ESCAPE) {
			selected = -1;
			break;
		}
		else if (key == ENTER)
			break;

		wbkgd(items[selected + 1], COLOR_PAIR(2));
                wrefresh(items[selected + 1]);
	}

	if (key == ENTER) {
		if (2 == selected)
			program = "exit";
		else if (0 == selected)
			program = "./3000shell";
		else if (1 == selected)
			program = "bash";
	
	}
	endwin();           /* End curses mode   */
	
       if (3 == selected) exit(0);
       if (execvpe(program, &program, environ) == -1)
       		printf("Error: %s\n", strerror(errno));


#elif _WIN32
	FreeLibrary(h);

	printf("Bye~~\n");
#endif



}
