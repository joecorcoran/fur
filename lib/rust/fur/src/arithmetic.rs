pub mod arithmetic {
    #[no_mangle]
    pub extern "C" fn add(a: i32, b: i32) -> i32 {
        a + b
    }

    #[no_mangle]
    pub extern "C" fn subtract(a: i32, b: i32) -> i32 {
        a - b
    }

    #[no_mangle]
    pub extern "C" fn multiply(a: i32, b: i32) -> i32 {
        a * b
    }

    #[no_mangle]
    pub extern "C" fn divide(a: i32, b: i32) -> i32 {
        a / b
    }
}
