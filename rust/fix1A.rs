use std::env;
use std::fs;

fn main() {
    let args:Vec<String> = env::args().collect();
    let data = match &fs::read(&args[1]) {
        Err(why) => panic!("{}",why),
        Ok(file) => file,
    };
    let mut savedata =data.clone();
    if savedata.pop()==Some(26) {
        savedata.pop();
        savedata.pop();
        match fs::write(&args[1],savedata){
            Err(why) => panic!("{}",why),
            Ok(_) => println!("{}","Ok"),
        };
    }    
}
