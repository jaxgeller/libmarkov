#include <iostream>
#include <string>
#include <vector>
#include <stdio.h>
#include <string.h>
#include <unordered_map>
#include <ctype.h>

using namespace std;

int main () {
  map<string, vector<string> > mp;
  vector<string> holder(2);
  string prefix;

  char str[] ="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis facere doloribus possimus. Mollitia eveniet, est, praesentium illum magnam, optio itaque quae impedit reprehenderit aliquam, expedita esse voluptatum animi nesciunt porro. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque dolorem ex, reprehenderit magnam dolorum quas nisi, nostrum ipsum aliquid vitae officia fugiat! Deserunt at aliquam, vitae architecto? Iusto, accusamus, qui.";

  char *word;
  word = strtok (str," ");

  while (word != NULL) {

    holder[0] = holder[1];
    holder[1] = word;
    prefix = holder[0] + " " + holder[1];

    mp[prefix].push_back(word);
    word = strtok (NULL, " ");
  }

  string upper = "";

  for (auto m = mp.begin(); m != mp.end(); ++m) {

    if ( isupper(m->first[0]) ) {
      upper = m->first;
      break;
    }
  }


  return 0;
}

