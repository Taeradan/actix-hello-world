extern crate actix_web;

use actix_web::{App, HttpRequest, server};

fn index(_req: &HttpRequest) -> &'static str {
    println!("Hello, world!");
    "Hello world!"
}

fn main() {
    server::new(|| App::new().resource("/", |r| r.f(index)))
        .bind("0.0.0.0:8088")
        .unwrap()
        .run();
}
