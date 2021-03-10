# use latest Rust stable release as base image
FROM rust:1.49

# switch working directory to `app`
# the folder will be created by Docker if it doesn't already exist
WORKDIR app
# copy all the files from the working environment to the Docker image
COPY . .
ENV SQLX_OFFLINE true
# build the binary, use the `--release` profile to make it fast & optimized
RUN cargo build --release
# when `docker run` is executed, launch the binary
ENTRYPOINT ["./target/release/zero2prod"]