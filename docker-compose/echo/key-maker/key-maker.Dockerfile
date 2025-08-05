FROM troupe-integrity AS builder
WORKDIR /Troupe/p2p-tools/relay
RUN make build

FROM alpine:latest
WORKDIR /key-maker
RUN apk add --no-cache nodejs
COPY --from=builder /Troupe/p2p-tools/built/mkid.mjs /key-maker
COPY --from=builder /Troupe/p2p-tools/built/mkaliases.js /key-maker
COPY --from=builder /Troupe/node_modules/@libp2p /key-maker/node_modules/@libp2p
COPY --from=builder /Troupe/node_modules/uint8arrays /key-maker/node_modules/uint8arrays
COPY --from=builder /Troupe/node_modules/yargs /key-maker/node_modules/yargs
COPY --from=builder /Troupe/node_modules/node-forge /key-maker/node_modules/node-forge
COPY --from=builder /Troupe/node_modules/multiformats /key-maker/node_modules/multiformats
COPY --from=builder /Troupe/node_modules/protons-runtime /key-maker/node_modules/protons-runtime
COPY --from=builder /Troupe/node_modules/cliui /key-maker/node_modules/cliui
COPY --from=builder /Troupe/node_modules/escalade /key-maker/node_modules/escalade
COPY --from=builder /Troupe/node_modules/y18n /key-maker/node_modules/y18n
COPY --from=builder /Troupe/node_modules/@noble /key-maker/node_modules/@noble
COPY --from=builder /Troupe/node_modules/string-width /key-maker/node_modules/string-width
COPY --from=builder /Troupe/node_modules/strip-ansi /key-maker/node_modules/strip-ansi
COPY --from=builder /Troupe/node_modules/emoji-regex /key-maker/node_modules/emoji-regex
COPY --from=builder /Troupe/node_modules/wrap-ansi /key-maker/node_modules/wrap-ansi
COPY --from=builder /Troupe/node_modules/ansi-styles /key-maker/node_modules/ansi-styles
COPY --from=builder /Troupe/node_modules/get-caller-file /key-maker/node_modules/get-caller-file
COPY --from=builder /Troupe/node_modules/require-directory /key-maker/node_modules/require-directory

COPY key-make.sh key-make.sh

RUN mkdir -p relay
RUN mkdir -p echo-server
RUN mkdir -p echo-client
RUN mkdir -p keys
ENTRYPOINT ["sh", "/key-maker/key-make.sh"]
