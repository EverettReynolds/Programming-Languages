
use std::fs;

fn main() {
    let mut tokens:i32 = 0;
    let filename = String::from("/pub/pounds/CSC330/translations/KJV.txt");

    let contents = fs::read_to_string(filename)
        .expect("Something went wrong reading the file");

    let uppercase_bible = contents.to_uppercase();

    let my_vec: Vec<char> = uppercase_bible.chars().collect();
    for index in 0..my_vec.len() {
        if  my_vec[index] != ' '  {
	    
            print!("{}", my_vec[index]);
	    tokens = tokens + 1;
        }
        else {
            println!();
        }
	

    }
	println!("There were {} tokens read in", tokens);
}