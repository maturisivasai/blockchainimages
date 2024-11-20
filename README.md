1.open the visual studio and then click on the file then click on the open folder then upload the downloaded folder from the github.
2.setup metamask wallet in the browser.
Here I’m taking google chrome as a example.
Steps:
Type chrome web store in the search bar then click on first link then click on extensions search for metamask wallet then click on add to browser then click on confirm.
Once it added to chrome as a extension then click on it then create an account set the password to the account.
Then connect the metamask to the local host.
click on the metamask wallet extension login to it then click on profile picture ontop left corner  in the metamask then click on add network then enter the follow details as
name:localsiva(give the name of the network as you wish)
new rpc url : click on add add new rpc url then enter http://localhost:8545 then click on add
chained:31337
currency sysmbol:go
then click on save.
Then select account in the metamask and then slect the network as local host in the metamask
3.Then open the terminal  in the visual studio then enter “npm install” command.
4.after successfully installing then split the terminal and enter “npx hardhat node” command.
5.After running the above command then right click on the blockchain folder then click on integrated terminal then give the “npx hardhat compile” command to run the solidity files.
Then enter the “npx hardhat run scripts/deploy.js –network localhost”  command to deploy the scripts in the local hardhat machine.
After successfully deploying the contracts thencopy the deployed address and paste it in the marketplace.jsx file and env.js file and save the files.
6.then split the terminal andthen give “npm start” to lanch the  sever in web browser.
Once it lanched successfully then it asks to connect with the metamask then enter password of metamask to connect.after that go to the visual studio then goto terminal to copy private key of the any of the account and then click on add account in metamask then paste that private key then click on save.

then you perform the mint,list,buy nft's.
