
# Call and Delegate call are two ways of calling a contract by another contract

Why there are two ways

The difference between two of them is execution context of targetcontract

In **call** method the calling contract and target contract have different execution context and storage

In **Delegatecall** method target contract uses calling contract storage and execution context.So we need to declare the variables in targetcontract in the same order as calling contract declared. Because EVM(Ethereum virtual machine assign a seperate slot for every variable).



