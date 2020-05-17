# chainlink-eth-multiword-adapter

Current implementation of chainlink does not support the ability to send multiple words through an adapater pipeline ending in `Ethtx`.

This repo circumvents this by encoding comma delimiter data as a `bytes32` word, that is then parsed to seperate strings.

```
ex: "1,200" -> "0x312c323030000000000000000000000000000000000000000000000000000000" as input

```

## notes
- parses 3 digit status codes from an adapter
- could use bitwise shifts in future e.g. avoid expensive strings

MIT LICENSE