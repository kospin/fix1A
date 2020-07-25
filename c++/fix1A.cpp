#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
using namespace std;

void fix(const char* filename) {
	char ch;
	ifstream file(filename);
	stringstream b;
	b << file.rdbuf();
	string s = "";
	while(b.get(ch)){
		s+=ch;
	}
	if (int(ch)==10){
		cout<<"­×¥¿";
		s=s.substr(0,s.length()-1);		
		while (int(s[s.length()-1])==10){
			 s=s.substr(0,s.length()-1);		
		 }
		ofstream file(filename);
		file << s; 
		file.close();
	}
}

int main(int argc, char** argv) {
	if (argc < 2) {
		return -1;
	}
	fix(argv[1]);
	return 0;
}

