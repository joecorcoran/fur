pub mod lists {
    use std::slice;

    #[no_mangle]
    pub unsafe extern fn head(list: &i32, length: i32) -> i32 {
        let ls = slice::from_raw_parts(list, length as usize);
        match ls.get(0) {
            Some(&v) => v,
            None => -1
        }
    }

    #[no_mangle]
    pub unsafe extern fn last(list: &i32, length: i32) -> i32 {
        let ls = slice::from_raw_parts(list, length as usize);
        match ls.last() {
            Some(&v) => v,
            None => -1
        }
    }
}
