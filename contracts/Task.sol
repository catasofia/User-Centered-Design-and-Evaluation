pragma solidity ^0.4.18;

contract Task {
    struct Stats {
        uint discount;
        uint256 dateTaskDone;
        string tenant_id;
        uint[] rates;
        string[] rater_ids;
        uint256[] dateEvaluation;
    }

    mapping (string => Stats) allStats;
    string[] public tasksAccts;

    function addingTenantToTask(string memory _taskId, string memory _tenantId, uint _dt) public {
        var tk = allStats[_taskId];

        tk.tenant_id = _tenantId;
        tk.discount = _dt;

        tasksAccts.push(_taskId) -1;
    }

    function tenantMarkedAsDone(string memory _taskId) public{
        var tk = allStats[_taskId];
        tk.dateTaskDone = block.timestamp;
        tasksAccts.push(_taskId)-1;
    }

    function evaluationRate(string memory taskId, uint rate) public{
        var task = allStats[taskId];
        task.rates.push(rate);
    }

    function evaluationDateEvaluation(string memory taskId) public{
        var task = allStats[taskId];
        task.dateEvaluation.push(block.timestamp);
    }

    function evaluationRaterId(string memory taskId, string memory raterId) public{
        var task = allStats[taskId];
        task.rater_ids.push(raterId);
    }

    function getDiscount(string memory tk) view public returns (uint) {
        return allStats[tk].discount;
    }

    function getRate(string memory taskId) public view returns (uint[]){
        var tk = allStats[taskId];
        return tk.rates;
    }

}