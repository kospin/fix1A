#include <iostream>
#include <fstream>
#include <sstream>
using namespace std;

/* run this program using the console pauser or add your own getch, system("pause") or input loop */
void fix1(const char* filename) {
	int c,d;
	FILE *file;
	file=fopen(filename,"rt");
	if (file==NULL) {
		return ;
	}
	do {
		c=fgetc(file);
		if(c==EOF)
			break;
		if(c==10) {
			d=fgetc(file);
			if(d==EOF) {
				break;
			} else {
				putchar(c);
				putchar(d);
			}
		} else {
			putchar(c);
		}
	} while(true);
	fclose(file);
}

int main(int argc, char** argv) {
	if (argc < 2) {
		cout << "¿ù»~°Ñ¼Æ\n" ;
		return -1;
	}
	fix1(argv[1]);
	return 0;
}

