#[no_mangle]
pub extern "C" fn fur_add(a: i32, b: i32) -> i32 {
  a + b
}

#[no_mangle]
pub extern "C" fn fur_subtract(a: i32, b: i32) -> i32 {
  a - b
}

#[no_mangle]
pub extern "C" fn fur_multiply(a: i32, b: i32) -> i32 {
  a * b
}

#[no_mangle]
pub extern "C" fn fur_divide(a: i32, b: i32) -> i32 {
  a / b
}
