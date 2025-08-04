# I take no responsibilities for bloated Docker images. Proceed at your own risk :)
FROM rust
RUN cargo install --locked --git https://github.com/use-ink/cargo-contract
WORKDIR /app
COPY . .
CMD cargo contract test