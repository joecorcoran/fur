pub mod comparison {
  #[no_mangle]
  pub extern "C" fn eq(a: i32, b: i32) -> i32 {
    if a == b { 1 } else { 2 }
  }

  #[no_mangle]
  pub extern "C" fn lt(a: i32, b: i32) -> i32 {
    if a < b { 1 } else { 2 }
  }

  #[no_mangle]
  pub extern "C" fn gt(a: i32, b: i32) -> i32 {
    if a > b { 1 } else { 2 }
  }

  #[no_mangle]
  pub extern "C" fn lte(a: i32, b: i32) -> i32 {
    if a <= b { 1 } else { 2 }
  }

  #[no_mangle]
  pub extern "C" fn gte(a: i32, b: i32) -> i32 {
    if a >= b { 1 } else { 2 }
  }
}
