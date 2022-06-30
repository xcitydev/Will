pragma solidity >=0.7.0 <0.9.0;

contract Will{
    address owner;
    uint amount;
    bool isDead;

    constructor()payable{
        owner = msg.sender;
        amount = msg.value;
        isDead = false;
    }

    modifier Own{
        require(owner == msg.sender);
        _;
    }
    modifier mustDead{
        require(isDead == true);
        _;
    }

    address payable[] familyWallets;
    address [] familyWallet;
    mapping(address => uint) inheritance;

    function setInheritance(address payable wallet, uint amountEth) public{
        familyWallets.push(wallet);
        familyWallet.push(wallet);
        inheritance[wallet] = amountEth;

    }

    function payOut()  private mustDead{
        for(uint i=0; i < familyWallets.length; i++){
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
        }
    }
    
    function dead() public Own {
        isDead = true;
        payOut();
    }
   function deleteWallet(){
       
   }
}