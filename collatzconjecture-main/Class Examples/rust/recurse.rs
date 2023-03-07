fn fact(n: u64) -> u64
{
    match n
    {
        0 => 1,
        _ => n * fact(n-1)
    }
}

fn main() 
{
    

    for i in 1..10 
    {
        print!(" {}" , fact(i))
    }
}