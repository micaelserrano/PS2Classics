FROM alpine:3.21 AS builder
RUN apk add --no-cache build-base
COPY ps2classic-ps2classic/ /src/
WORKDIR /src
RUN make CFLAGS="-static -O2 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="-static"

FROM scratch
COPY --from=builder /src/ps2classic /ps2classic
