---
paths:
  - "**/*.rs"
  - "**/Cargo.toml"
  - "**/Cargo.lock"
---

# Rust

- **Imports**: Never merge imports. Each import must be on its own line:
  ```rust
  // Good
  use std::sync::Arc;
  use std::sync::Mutex;

  // Bad
  use std::sync::{Arc, Mutex};
  ```
- **No panics in production code**: Never use `.unwrap()` or `.expect()` outside of tests. Use `?` or proper error handling instead.
- **Before committing**: Always run `cargo fmt`, `cargo clippy`, `cargo test`, and `cargo build`.
