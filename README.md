# chainlink-eth-multiword-adapter

Current implementation of chainlink does not support the ability to send multiple words through an adapater pipeline ending in `Ethtx`.

This repo circumvents this by encoding comma delimiter data as a `bytes32` word using `EthBytes32` that is then parsed to seperate strings in a contract.

```
ex: string inputs -> bytes32 -> parsed

string: 1,200
bytes: 0x312c323030000000000000000000000000000000000000000000000000000000

string: 1,500
bytes: 0x312c353030000000000000000000000000000000000000000000000000000000

string: 1,404
bytes: 0x312c343034000000000000000000000000000000000000000000000000000000
```

Converted string to bytes32 using ethers 
```
const ethers = require('ethers')
const utils = ethers.utils
const bytes32 = utils.formatBytes32String(`${id},${possibleStatus}`)
```

## notes
- parses 3 digit status codes from an adapter
- could use bitwise shifts in future e.g. avoid expensive strings

MIT LICENSE
