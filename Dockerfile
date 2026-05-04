FROM alpine:3.21 AS builder
RUN apk add --no-cache build-base git openssl-dev openssl-libs-static
RUN git clone https://github.com/sdkmap/PS2Classics.git /src
WORKDIR /src
RUN make CFLAGS="-static -O2" LDFLAGS="-static"

FROM scratch
COPY --from=builder /src/ps2classic /ps2classic
