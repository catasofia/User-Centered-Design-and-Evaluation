pragma solidity ^0.5.9;

contract Task{
    uint public task_id;
    int public tenant_id;
    int public rate;
    int public rater_id;
    int public discount;
    uint public dateEvaluation;
    uint public dateTaskDone;


    constructor() public{
        task_id = 0;
        tenant_id = 1;
        rate = 0;
        rater_id = -1;
        discount = -1;
    }


    function setRate(int rt) public {
        rate = rt;
        dateEvaluation = block.timestamp;
    }

    function setRaterId(int id) public  {
        rater_id = id;
    }

    function setDateTaskDone() public  {
        dateTaskDone = block.timestamp;
    }

    function setTaskId(uint id) public  {
        task_id = id;
    }

    function setTenantId(int id) public  {
        tenant_id = id;
    }

    function setDiscount(int dt) public  {
        discount = dt;
    }
}