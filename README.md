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

7.now we try to mint the nft by giving the some image url from google then click on the mint nft then metamask prompt will appear for the confirm the transaction then click on confirm.
8.trying to mint the same nft to check is it allowing to duplicate the nft or not.
9.You can get the msg in the above image that”error minting nft.please try again” and you can see it the console in the browser by right click on page then click on inspect.
10.now list that nft for sale by giving the tokenid and setting  desired price then click on sell nft then confirm the transaction.
after successfully list the nft  for sale from account4 it will display the message ”nft listed for sale”.
11.buying that listed nft for sale from account3.
First I changed the account from account4 to account3 in the metamask.
Then click on buy nft then confirm the transaction.
Then it displays the message that”nft bought” then refresh the page then click on the fetch nfts it will appear in the account3.
12.you can see the transactions in the metamask wallet in account3 and account4.

