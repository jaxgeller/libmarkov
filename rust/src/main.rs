use std::collections::HashMap;

extern crate rand;
use rand::Rng;

extern crate regex;
use regex::Regex;


fn tokenize(s: &str) -> HashMap<String, Vec<&str>>{
    let mut dict = HashMap::new();
    let mut prefix = ["",""];
    for token in s.split_whitespace() {
        if prefix[0] != "" {
            let key = prefix.join(" ");
            if !dict.contains_key(&key) {
                dict.insert(key, vec![token]);
            } else {
                dict.get_mut(&key).unwrap().push(token);
            }
        }
        prefix[0] = prefix[1];
        prefix[1] = token;
    }
    return dict;
}



#[allow(dead_code)]
struct Generator<'a> {
    dict: HashMap<String, Vec<&'a str>>,
    text: &'a str,
    max: i32
}


impl<'a> Generator<'a> {
    fn new(t: &str) -> Generator{
        let d = tokenize(t);
        Generator { text:t, dict: d, max: 10}
    }

    fn get_init_key(&self) -> &str {
        let mut init_key = "";
        for key in self.dict.keys() {
            let c = &key[..1];
            if c.to_uppercase() == c { // ADD matcher for no punct
                init_key = &key;
                break;
            }
        }
        return init_key;
    }

    fn generate_sentence(&self) -> &str {
        let mut sentence: Vec<&str> = self.get_init_key().split(" ").collect();

        while true {
            let search = [ sentence[sentence.len()-2], sentence[sentence.len()-1] ].join(" ");
            let word = self.dict.get(&search).unwrap();
            sentence.push(word[rand::thread_rng().gen_range(0, word.len())]);

            if Regex::new(r"\.|!|\?").unwrap().is_match(sentence[sentence.len()-1]) {
                break;
            }
        }

        return sentence.join(" ");
    }

    fn generate(&self) -> &str {
        let mut sentences = vec![];
        while count > 0 {
            sentences.push(self.generate_sentence());
            count -= 1;
        }

        return sentences.join(" ");
    }
}


fn main() {
    let g = Generator::new("Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, assumenda! Error, deserunt quas cumque labore minima obcaecati facere vero temporibus, voluptatem aperiam veritatis rem tempora sequi rerum maxime officia aliquam?");

    // println!("{:?}", g.get_init_key());
}

// fn get_init_token(d: Dict) -> &str {
//     let mut init_key = "";
//     for key in d.keys() {
//         let c = &key[..1];
//         if c.to_uppercase() == c {
//             init_key = &key;
//             break;
//         }
//     }
//     return init_key;
// }

// fn main() {
//     let lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae facilis molestias quos quasi reprehenderit laboriosam ab vel ut, at aliquam in. Corporis veniam ad odio, quisquam voluptatibus fugit nobis facere!";

//     let dict = tokenize(lorem);
//     let init_key = get_init_token(dict);
// }


// // fn main() {
// //     // let mut dict = HashMap::new();
// //     // let mut prefix = ["", ""];

// //     let lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta molestiae ipsum, ad ab quia dolore, mollitia alias voluptatem modi officia minus ea ratione. Aliquid et dolor atque cupiditate tenetur quaerat!";

// //     let mut dict =tokenize(lorem);


// //     let numSentence = 10;

// //     // get init key
// //     let mut init_key = "";
// //     for key in dict.keys() {
// //         let c = &key[..1];
// //         if c.to_uppercase() == c {
// //             init_key = &key;
// //             break;
// //         }
// //     }

// //     let mut sentence: Vec<&str> = init_key.split(" ").collect();
// //     while true {
// //         let search = [ sentence[sentence.len()-2], sentence[sentence.len()-1] ].join(" ");
// //         let word = dict.get(&search).unwrap();
// //         let breakRegex = Regex::new(r"\.|!|\?").unwrap();let breakRegex = Regex::new(r"\.|!|\?").unwrap();
// //         let rand_el = rand::thread_rng().gen_range(0, word.len());
// //         sentence.push(word[rand_el]);

// //         if breakRegex.is_match(sentence[sentence.len()-1]) {
// //             break;
// //         }
// //     }

// //     println!("{:?}", sentence.join(" "));
// // }
