pub mod strings { 
    use libc::c_char;
    use std::ffi::{CStr,CString};
    use std::str;
    use unicode_segmentation::UnicodeSegmentation as UniSeg;

    #[no_mangle]
    pub extern fn reverse(s: *const c_char) -> *mut c_char {
        let cs = unsafe { assert!(!s.is_null()); CStr::from_ptr(s) };
        let rs = str::from_utf8(cs.to_bytes()).unwrap();
        let reversed: String = UniSeg::graphemes(rs, true).rev().collect();
        CString::new(reversed.as_bytes()).unwrap().into_raw()
    }
}
