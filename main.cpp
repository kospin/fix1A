#include <iostream>
#include <fstream>
#include <sstream>
using namespace std;

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int linecount(const string str){
		stringstream ss(str);
		string s;
		int count = 0;
		while(getline(ss,s,'\n')) {
			count++;
		}	
		return count;
}
void fix3(const char* filename) {
	
	ifstream file(filename); //open the input file

	stringstream strStream;
	strStream << file.rdbuf(); //read the file
	string str = strStream.str() ; //str holds the content of the file
	string s;
	
//	int count = 0;
//	while(getline(strStream,s,'\n')) {
//		count++;
//	}
	cout << linecount(str) << endl;
	
//	while(getline(strStream,s,'\n')) {
//		cout << s <<'\n';
//	}
	for(int i=0 ; i<linecount(str);i++){
		getline(strStream,s,'\n');
		cout << s << '\n';
	}
}

void fix2(const char* filename) {
	ifstream file;
	file.open(filename); //open the input file

	stringstream strStream;
	strStream << file.rdbuf(); //read the file
	string str = strStream.str(); //str holds the content of the file
	

//	for(int i=0; i<str.length();i++){
//		if(str[i]==26){
//			system("pause");
//		}
//		cout<<str[i];
//	}
	cout << str ; //you can do anything with the string!!!
}

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

