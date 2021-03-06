pub mod lists {
    use std::slice;
    use libc::c_int;

    #[repr(C)]
    pub struct FurList {
        size: c_int,
        data: *const c_int
    }

    #[no_mangle]
    pub unsafe extern fn head(list: &FurList) -> c_int {
        let ls = slice::from_raw_parts(list.data, list.size as usize);
        *ls.get(0).unwrap_or(&-1)
    }

    #[no_mangle]
    pub unsafe extern fn tail(list: &FurList) -> Box<FurList> {
        let ls = slice::from_raw_parts(list.data, list.size as usize);
        let (_, tail) = ls.split_at(1 as usize);
        let new_list = FurList {
            size: tail.len() as c_int,
            data: tail.as_ptr()
        };
        Box::new(new_list)
    }

    #[no_mangle]
    pub unsafe extern fn last(list: &FurList) -> c_int {
        let ls = slice::from_raw_parts(list.data, list.size as usize);
        *ls.last().unwrap_or(&-1)
    }
}
