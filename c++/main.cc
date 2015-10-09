// -std=c++11 -Wall
#include <iostream>
#include <string>
#include <vector>
#include <stdio.h>
#include <string.h>
#include <unordered_map>

int main () {
  using namespace std;

  unordered_map< string, vector<string> > map;
  vector<string> holder(2);
  string prefix;


  char str[] ="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis facere doloribus possimus. Mollitia eveniet, est, praesentium illum magnam, optio itaque quae impedit reprehenderit aliquam, expedita esse voluptatum animi nesciunt porro.";

  char *word;
  word = strtok (str," ");


  while (word != NULL) {

    holder[0] = holder[1];
    holder[1] = word;
    prefix = holder[0] + " " + holder[1];

    map[prefix].push_back(word);

    word = strtok (NULL, " ");
  }

  return 0;
}
