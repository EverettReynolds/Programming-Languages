fn iter(n: u64) -> u64 
{
    (1..=n).product()
}

fn main() 
{
    

    for i in 1..10 
    {
        print!(" {}" , iter(i))
    }
}
