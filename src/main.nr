global PRIME: u32 = 16777619;

fn main(value: u32, hash_value: pub u32){
    let calculated_hash_value = calculate_hash(value);

    assert(calculated_hash_value == hash_value);
}

fn calculate_hash(num: u32) -> u32 {
    // let field = 2;
    // let size = field.pow_32(32);
    // let mut hash_value:u32 = 0x811C9DC5;
    // let numField = num as Field;
    // let numBytes = numField.to_be_bytes(4);

    // for i in 0..4 {
    //     let product = (hash_value * PRIME) % (size as u32) ;
    //     hash_value = product  ^ (numBytes[i] as u32)  ;
    // }

    // let two = 2;
    // let size = two.pow_32(32);
    // let field = num as Field;
    // let b = field.to_be_bytes(4);
    // let mut hash_value:u32 = 0x811C9DC5;
    // for i in 0..4{
    //     let product = hash_value * PRIME % (size as u32);
    //     hash_value = product ^ (b[i] as u32);
    // }

    let field = num as Field;
    let b = field.to_be_bytes(4);
    let mut hash_value = 0x811C9DC5;
    for i in 0..4{
        let product = hash_value as u32 * PRIME;
        hash_value = product ^ (b[i] as u32);
    }

    // let field = 2;
    // let size: u32 = field.pow_32(32) as u32;
    // let mut hash_value:u32 = 0x811C9DC5;
    // // let prime = 0x1000193;

    // for byte in (num as Field).to_be_bytes(4) {
    //     let product: u32 = (hash_value * PRIME)  % size;
    //     hash_value = product ^ (byte as u32);
    // }

    hash_value
}


#[test]
fn test_1() {
    let num = 127561628;
    let hash = calculate_hash(num);
    
    assert(hash == 0x71233de7);
}

#[test]
fn test_2() {
    let num = 237261828;
    let hash = calculate_hash(num);

    assert(hash == 0x7F51D567);
}

#[test]
fn test_3() {
    let num = 596214892;
    let hash = calculate_hash(num);

    assert(hash == 0x3F0C8995);
}
