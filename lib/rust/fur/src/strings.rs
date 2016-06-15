pub mod strings {
    use std::slice;
    use libc::c_int;

    #[repr(C)]
    pub struct FurString {
        size: c_int,
        data: *const c_int
    }

    #[no_mangle]
    pub unsafe extern fn passthru(a: &FurString) -> Box<FurString> {
        let slice = slice::from_raw_parts(a.data, a.size as usize);
        let new_string = FurString {
            size: slice.len() as c_int,
            data: slice.as_ptr()
        };
        Box::new(new_string)
    }
}
