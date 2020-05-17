import "github.com/Arachnid/solidity-stringutils/strings.sol";

pragma experimental ABIEncoderV2;

contract MultiwordAdapter {
    using strings for *;
    
    string public id;
    string public code;
    
    mapping(string => string[]) statusById;
    
    event LogStatus(string indexed id, string indexed status);
    
    function update(bytes32 status) public returns (string, string){

        string memory str = string(abi.encodePacked(status));
        var status_slice = str.toSlice();
        var id_slice = status_slice.split(",".toSlice());
        
        bytes memory statusBytes = bytes(status_slice.toString());
        
        bytes memory bytesStringTrimmed = new bytes(3);
        bytesStringTrimmed[0] = statusBytes[0];
        bytesStringTrimmed[1] = statusBytes[1];
        bytesStringTrimmed[2] = statusBytes[2];
        
        code = string(bytesStringTrimmed);
        id = id_slice.toString();
        
        statusById[id].push(code);
        
        emit LogStatus(id, code);

        return (id, code);
    }
    
    function getStatus(string _id) public view returns (string[]){
        return statusById[_id];
    }
    
}