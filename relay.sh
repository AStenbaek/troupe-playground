node /relay/mkid.mjs --privkeyfile=keys/relay.priv --idfile=keys/relay.id --verbose
DEBUG=libp2p:circuit-relay:server,libp2p:yamux:trace node relay.mjs
