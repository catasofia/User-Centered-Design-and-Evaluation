import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://10.0.2.2:8545";
  final String _wsUrl = "ws://10.0.2.2:8545/";
  final String _privateKey = "0xf9038349c7290668590579de499df16a36128404b6b763e64261c17bf79c479e";


  late Web3Client _client;
  bool isLoading = true;

  late String _abiCode;
  late EthereumAddress _contractAddress;

  late Credentials _credentials;

  late DeployedContract _contract;
  late ContractFunction _addingTenantToTask;
  late ContractFunction _tenantMarkedAsDone;
  late ContractFunction _evaluationRate;
  late ContractFunction _evaluationDateEvaluation;
  late ContractFunction _evaluationRaterId;
  late ContractFunction _getDiscount;
  late ContractFunction _getRate;
  late ContractFunction _task_result;

  var task_result;
  double rate = 0;
  late String discount;

  ContractLinking() {
    initialSetup();
  }

  initialSetup() async {

    // establish a connection to the ethereum rpc node. The socketConnector
    // property allows more efficient event streams over websocket instead of
    // http-polls. However, the socketConnector property is experimental.
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {

    // Reading the contract abi
    final abiStringFile =
    await rootBundle.loadString("src/artifacts/Task.json");
    final jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);
    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
  }

  Future<void> getCredentials() async {
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }

  Future<void> getDeployedContract() async {

    // Telling Web3dart where our contract is declared.
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "Task"), _contractAddress);

    // Extracting the functions, declared in contract.
    _addingTenantToTask = _contract.function("addingTenantToTask");
    _tenantMarkedAsDone = _contract.function("tenantMarkedAsDone");
    _evaluationRate = _contract.function("evaluationRate");
    _evaluationDateEvaluation = _contract.function("evaluationDateEvaluation");
    _evaluationRaterId = _contract.function("evaluationRaterId");
    _getDiscount = _contract.function("getDiscount");
    _getRate = _contract.function("getRate");
    //_task_result = _contract.function("task_result");

    isLoading = false;
    notifyListeners();
    //getData
  }

  getData(String taskId) async {
    List name = await _client
        .call(contract: _contract, function: _task_result, params: [taskId]);
    task_result = name[0];
    isLoading = false;
    notifyListeners();
  }

  addTenant(String taskId, String tenantId, BigInt dt) async{
    isLoading = true;
    notifyListeners();
    print("antes");
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _addingTenantToTask,
            parameters: [taskId, tenantId, dt],));
    print("depois");
    getDiscount(taskId);

  }

  tenantMarkedAsDone(String taskId) async {
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _tenantMarkedAsDone,
            parameters: [taskId],
        maxGas: 3000000));
    getData(taskId);
  }

  evaluateRate(String taskId, BigInt rt) async{
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _evaluationRate,
            parameters: [taskId, rt]));

    getRate(taskId);
    isLoading = false;
    notifyListeners();
  }

  evaluateDate(String taskId) async{
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _evaluationDateEvaluation,
            parameters: [taskId]));
    getData(taskId);
  }

  evaluateRaterId(String taskId, String raterId) async{
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _evaluationRaterId,
            parameters: [taskId, raterId]));
    getData(taskId);
  }

  getDiscount(String taskId) async{
    print("aquiii");
    int name = (await _client
        .call(contract: _contract, function: _getDiscount, params: [taskId])) as int;
    print("name");
    //discount = name[0].toString();
    isLoading = false;
    notifyListeners();
  }

  getRate(String taskId) async{
    List name = await _client
        .call(contract: _contract, function: _getRate, params: [taskId]);
    rate = name[0];
    isLoading = false;
    notifyListeners();
  }
}