
const Task = artifacts.require("Task") ;

contract("Task" , () => {
    it("Task Testing" , async () => {
       const task = await Task.deployed() ;
       await task.setRate(3) ;
       const result = await task.rate();
       assert.equal(result, 3) ;
    });
});