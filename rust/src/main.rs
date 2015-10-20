use std::collections::HashMap;

fn main() {
    let mut dict = HashMap::new();
    let mut prefix = ["", ""];

    let lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum debitis earum quidem dolorem quos consequatur perspiciatis architecto! Reiciendis rem est blanditiis fugiat quidem similique suscipit soluta, ab veniam, laborum numquam. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum debitis earum quidem dolorem quos consequatur perspiciatis architecto! Reiciendis rem est blanditiis fugiat quidem similique suscipit soluta, ab veniam, laborum numquam.";

    for token in lorem.split_whitespace() {
        if prefix[0] != "" {

            let key = prefix.join(" ");

            if !dict.contains_key(&key) {
                dict.insert(key, vec![token]);
            } else {
                let v = dict.get_mut(&key).unwrap();
                v.push(token);
            }
        }

        prefix[0] = prefix[1];
        prefix[1] = token;
    }

    // get init key
    let mut init_key = "";
    for key in dict.keys() {
        let c = &key[..1];
        if c.to_uppercase() == c {
            init_key = &key;
            break;
        }
    }

    let mut times = 10;

    let mut sentence = vec!["Lorem", "ipsum"];
    while times > 0 {
        times = times - 1;
        let search = [ sentence[sentence.len()-2], sentence[sentence.len()-1] ].join(" ");
        let word = dict.get(&search).unwrap();
        sentence.push(word[0]);
    }

    println!("{:?}", sentence);
}
