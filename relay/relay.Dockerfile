FROM troupe-integrity AS builder
WORKDIR /Troupe/p2p-tools/relay
RUN make build

FROM alpine:latest
WORKDIR /relay
RUN apk add --no-cache nodejs
COPY --from=builder /Troupe/p2p-tools/relay /relay
COPY --from=builder /Troupe/p2p-tools/built/mkid.mjs /relay
COPY --from=builder /Troupe/node_modules/@libp2p /relay/node_modules/@libp2p
COPY --from=builder /Troupe/node_modules/uint8arrays /relay/node_modules/uint8arrays
COPY --from=builder /Troupe/node_modules/yargs /relay/node_modules/yargs
COPY --from=builder /Troupe/node_modules/node-forge /relay/node_modules/node-forge
COPY --from=builder /Troupe/node_modules/multiformats /relay/node_modules/multiformats
COPY --from=builder /Troupe/node_modules/protons-runtime /relay/node_modules/protons-runtime
COPY --from=builder /Troupe/node_modules/cliui /relay/node_modules/cliui
COPY --from=builder /Troupe/node_modules/escalade /relay/node_modules/escalade
COPY --from=builder /Troupe/node_modules/y18n /relay/node_modules/y18n
COPY --from=builder /Troupe/node_modules/@noble /relay/node_modules/@noble
COPY --from=builder /Troupe/node_modules/@chainsafe /relay/node_modules/@chainsafe
COPY --from=builder /Troupe/node_modules/libp2p /relay/node_modules/libp2p
COPY --from=builder /Troupe/node_modules/it-pipe /relay/node_modules/it-pipe
COPY --from=builder /Troupe/node_modules/it-length-prefixed /relay/node_modules/it-length-prefixed
COPY --from=builder /Troupe/node_modules/it-map /relay/node_modules/it-map
COPY --from=builder /Troupe/node_modules/@multiformats /relay/node_modules/@multiformats
COPY --from=builder /Troupe/node_modules/it-ws /relay/node_modules/it-ws
COPY --from=builder /Troupe/node_modules/p-defer /relay/node_modules/p-defer
COPY --from=builder /Troupe/node_modules/wherearewe /relay/node_modules/wherearewe
COPY --from=builder /Troupe/node_modules/debug /relay/node_modules/debug
COPY --from=builder /Troupe/node_modules/it-pushable /relay/node_modules/it-pushable
COPY --from=builder /Troupe/node_modules/it-merge /relay/node_modules/it-merge
COPY --from=builder /Troupe/node_modules/it-peekable /relay/node_modules/it-peekable
COPY --from=builder /Troupe/node_modules/it-pair /relay/node_modules/it-pair
COPY --from=builder /Troupe/node_modules/it-pb-stream /relay/node_modules/it-pb-stream
COPY --from=builder /Troupe/node_modules/abortable-iterator /relay/node_modules/abortable-iterator
COPY --from=builder /Troupe/node_modules/any-signal /relay/node_modules/any-signal
COPY --from=builder /Troupe/node_modules/is-electron /relay/node_modules/is-electron
COPY --from=builder /Troupe/node_modules/rate-limiter-flexible /relay/node_modules/rate-limiter-flexible
COPY --from=builder /Troupe/node_modules/p-timeout /relay/node_modules/p-timeout
COPY --from=builder /Troupe/node_modules/datastore-core /relay/node_modules/datastore-core
COPY --from=builder /Troupe/node_modules/merge-options /relay/node_modules/merge-options
COPY --from=builder /Troupe/node_modules/it-first /relay/node_modules/it-first
COPY --from=builder /Troupe/node_modules/it-queueless-pushable /relay/node_modules/it-queueless-pushable
COPY --from=builder /Troupe/node_modules/uint8arraylist /relay/node_modules/uint8arraylist
COPY --from=builder /Troupe/node_modules/err-code /relay/node_modules/err-code
COPY --from=builder /Troupe/node_modules/uint8-varint /relay/node_modules/uint8-varint
COPY --from=builder /Troupe/node_modules/get-iterator /relay/node_modules/get-iterator
COPY --from=builder /Troupe/node_modules/it-batched-bytes /relay/node_modules/it-batched-bytes
COPY --from=builder /Troupe/node_modules/varint /relay/node_modules/varint
COPY --from=builder /Troupe/node_modules/ws /relay/node_modules/ws
COPY --from=builder /Troupe/node_modules/@achingbrain /relay/node_modules/@achingbrain
COPY --from=builder /Troupe/node_modules/interface-datastore /relay/node_modules/interface-datastore
COPY --from=builder /Troupe/node_modules/sanitize-filename /relay/node_modules/sanitize-filename
COPY --from=builder /Troupe/node_modules/it-all /relay/node_modules/it-all
COPY --from=builder /Troupe/node_modules/it-filter /relay/node_modules/it-filter
COPY --from=builder /Troupe/node_modules/p-retry /relay/node_modules/p-retry
COPY --from=builder /Troupe/node_modules/race-signal /relay/node_modules/race-signal
COPY --from=builder /Troupe/node_modules/longbits /relay/node_modules/longbits
COPY --from=builder /Troupe/node_modules/event-iterator /relay/node_modules/event-iterator
COPY --from=builder /Troupe/node_modules/mortice /relay/node_modules/mortice
COPY --from=builder /Troupe/node_modules/it-drain /relay/node_modules/it-drain
COPY --from=builder /Troupe/node_modules/retry /relay/node_modules/retry
COPY --from=builder /Troupe/node_modules/it-sort /relay/node_modules/it-sort
COPY --from=builder /Troupe/node_modules/it-take /relay/node_modules/it-take
COPY --from=builder /Troupe/node_modules/p-queue /relay/node_modules/p-queue
COPY --from=builder /Troupe/node_modules/byte-access /relay/node_modules/byte-access
COPY --from=builder /Troupe/node_modules/jsbn /relay/node_modules/jsbn
COPY --from=builder /Troupe/node_modules/sprintf-js /relay/node_modules/sprintf-js
COPY --from=builder /Troupe/node_modules/private-ip /relay/node_modules/private-ip
COPY --from=builder /Troupe/node_modules/eventemitter3 /relay/node_modules/eventemitter3
COPY --from=builder /Troupe/node_modules/it-handshake /relay/node_modules/it-handshake
COPY --from=builder /Troupe/node_modules/it-reader /relay/node_modules/it-reader
COPY --from=builder /Troupe/node_modules/netmask /relay/node_modules/netmask
COPY --from=builder /Troupe/node_modules/ip-regex /relay/node_modules/ip-regex
COPY --from=builder /Troupe/node_modules/progress-events /relay/node_modules/progress-events
COPY --from=builder /Troupe/node_modules/ipaddr.js /relay/node_modules/ipaddr.js
COPY --from=builder /Troupe/node_modules/hashlru /relay/node_modules/hashlru
COPY --from=builder /Troupe/node_modules/ms /relay/node_modules/ms
COPY --from=builder /Troupe/node_modules/is-plain-obj /relay/node_modules/is-plain-obj
COPY --from=builder /Troupe/node_modules/truncate-utf8-bytes /relay/node_modules/truncate-utf8-bytes

COPY relay.sh relay.sh
RUN mkdir -p keys
CMD ["sh", "relay.sh"]

