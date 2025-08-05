node /key-maker/mkid.mjs --privkeyfile=keys/relay.priv --idfile=keys/relay.id
node /key-maker/mkid.mjs --outfile=keys/echo-server.json
node /key-maker/mkid.mjs --outfile=keys/echo-client.json
node /key-maker/mkaliases.js --include=keys/echo-server.json --include=keys/echo-client.json --outfile=keys/aliases.json
cp keys/relay.priv /key-maker/relay/
cp keys/relay.id /key-maker/relay/
cp keys/relay.id /key-maker/echo-server/
cp keys/echo-server.json /key-maker/echo-server/
cp keys/relay.id /key-maker/echo-client/
cp keys/echo-client.json /key-maker/echo-client/
cp keys/aliases.json /key-maker/echo-client/
