---
paths:
  - "**/*.rs"
  - "**/Cargo.toml"
  - "**/Cargo.lock"
---

# Rust

## Imports
- Never merge imports. Each import must be on its own line:
  ```rust
  // Good
  use std::sync::Arc;
  use std::sync::Mutex;

  // Bad
  use std::sync::{Arc, Mutex};
  ```

## Error Handling
- **No panics in production code**: Never use `.unwrap()` or `.expect()` in runtime/production code. Test code (`#[cfg(test)]`) and compile-time code (proc macros, build scripts) may use them.
- Use `?` operator for error propagation. Use `match`, `if let`, or `let-else` when `?` doesn't fit:
  ```rust
  let Some(value) = some_option else {
      return Err(Error::MissingValue);
  };
  ```
- Use `thiserror` for defining error enums. Don't use `anyhow` in library code — reserve it for application-level binaries.
- Prefer `?` over `.map_err()` chains when the `From` impl exists. Don't wrap errors unnecessarily.

## Control Flow
- Prefer early returns and `let-else` over nested if-else chains.

## Type System
- Prefer `pub(crate)` over `pub` for types that don't need to be public API.
- Prefer newtypes or enums over raw booleans and strings when they improve readability.
- Only derive traits that are actually used. `Debug` is almost always appropriate. Don't defensively derive "just in case" — remove unused derives.

## Performance
- Avoid unnecessary `.clone()` — pass references where possible.
- Prefer `&str` over `String` in function parameters when ownership isn't needed. Use `Cow<str>` when a function sometimes needs to allocate and sometimes doesn't.

## Testing
- Use `rstest` for parameterized tests when testing multiple input/output combinations.
- Prefer explicit assertions in the test body over hidden assertions in helpers.
- Use builder pattern or `Default` with explicit overrides for test fixtures.

## Before Committing
- Always run `cargo fmt`, `cargo clippy`, `cargo test`, and `cargo build`.
