import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';


class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://10.0.2.2:7545";
  final String _wsUrl = "ws://10.0.2.2:7545/";
  final String _privateKey = "a6ebba969fa043360199dab6e9a5143c326f9eabb4cf62fef64f07c7f75215d7";


  late Web3Client _client;
  bool isLoading = true;

  late String _abiCode;
  late EthereumAddress _contractAddress;

  late Credentials _credentials;

  late DeployedContract _contract;

  late ContractFunction _task_id;
  late ContractFunction _tenant_id;
  late ContractFunction _rate;
  late ContractFunction _raterId;
  late ContractFunction _discount;
  late ContractFunction _dateTaskDone;
  late ContractFunction _dateEvaluation;
  late ContractFunction _setRate;
  late ContractFunction _setRaterId;
  late ContractFunction _setDateTaskDone;
  late ContractFunction _setTaskId;
  late ContractFunction _setTenantId;
  late ContractFunction _setDiscount;

  late String task_Id;
  late String tenant_Id;
  late String rate;
  late String rater_id;
  late String discount;
  late String dateTaskDone;
  late String dateEvaluation;

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
    final String abiStringFile =
    await rootBundle.loadString("src/artifacts/Task.json");
    final jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);

    _contractAddress = EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
  }
  Future<void> getCredentials() async {
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }

  Future<void> getDeployedContract() async {

    // Telling Web3dart where our contract is declared.
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "Task"), _contractAddress);

    // Extracting the functions, declared in contract.
    _task_id = _contract.function("task_id");
    _tenant_id = _contract.function("tenant_id");
    _rate = _contract.function("rate");
    _raterId = _contract.function("rater_id");
    _discount = _contract.function("discount");
    _dateTaskDone = _contract.function("dateTaskDone");
    _dateEvaluation = _contract.function("dateEvaluation");
    _setRate = _contract.function("setRate");
    _setRaterId = _contract.function("setRaterId");
    _setDateTaskDone = _contract.function("setDateTaskDone");
    _setTaskId = _contract.function("setTaskId");
    _setTenantId = _contract.function("setTenantId");
    _setDiscount = _contract.function("setDiscount");
    getData();
  }

  getData() async {

    // Getting the current name and population declared in the smart contract.
    List task = await _client
        .call(contract: _contract, function: _task_id, params: []);
    task_Id = task[0].toString();

    List tenant = await _client
        .call(contract: _contract, function: _tenant_id, params: []);
    tenant_Id = tenant[0].toString();

    List rate_aux = await _client
        .call(contract: _contract, function: _rate, params: []);
    rate = rate_aux[0].toString();

    List rater = await _client
        .call(contract: _contract, function: _raterId, params: []);
    rater_id = rater[0].toString();

    List discount_aux = await _client
        .call(contract: _contract, function: _discount, params: []);
    discount = discount_aux[0].toString();

    List date = await _client
        .call(contract: _contract, function: _dateTaskDone, params: []);
    dateTaskDone = date[0].toString();

    List dateE = await _client
        .call(contract: _contract, function: _dateEvaluation, params: []);
    dateEvaluation = dateE.toString();

    isLoading = false;
    notifyListeners();
  }

  getTaskId() async {
    // Getting the current name declared in the smart contract.
    List task = await _client
        .call(contract: _contract, function: _task_id, params: []);
    task_Id = task[0].toString();
    isLoading = false;
    notifyListeners();
  }

  getTenantId() async {
    // Getting the current name declared in the smart contract.
    List tenant = await _client
        .call(contract: _contract, function: _tenant_id, params: []);
    tenant_Id = tenant[0].toString();
    isLoading = false;
    notifyListeners();
  }

  getRate() async {
    var rate_aux = await _client
        .call(contract: _contract, function: _rate, params: []);
    rate = rate_aux[0].toString();
    isLoading = false;
    notifyListeners();
  }

  getRaterId() async {
    List rater = await _client
        .call(contract: _contract, function: _raterId, params: []);
    rater_id = rater[0].toString();
    isLoading = false;
    notifyListeners();
  }

  getDiscount() async {
    List discount_aux = await _client
        .call(contract: _contract, function: _discount, params: []);
    discount = discount_aux[0].toString();
    isLoading = false;
    notifyListeners();
  }

  getDateTaskDone() async {
    List date = await _client
        .call(contract: _contract, function: _dateTaskDone, params: []);
    dateTaskDone = date[0].toString();
    isLoading = false;
    notifyListeners();
  }

  getDateEvaluation() async {
    List date = await _client
        .call(contract: _contract, function: _dateEvaluation, params: []);
    final DateTime date1 = DateTime.fromMillisecondsSinceEpoch(date[0] * 1000);
    dateEvaluation = date1.toString();
    isLoading = false;
    notifyListeners();
  }

  setRate(BigInt rateToSet) async {
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _setRate, parameters: [rateToSet]));

    getRate();
  }

  setRaterId(BigInt raterIdToSet) async {
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _setRaterId, parameters: [raterIdToSet]));

    getRaterId();
  }

  setDateTaskDone() async {
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _setDateTaskDone, parameters: []));
    getDateTaskDone();
  }

  setTaskId(BigInt idToSet) async {
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _setTaskId, parameters: [idToSet]));
    getTaskId();
  }

  setTenantId(BigInt tenantIdToSet) async {
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _setTenantId, parameters: [tenantIdToSet]));
    getTenantId();
  }

  setDiscount(BigInt discountToSet) async {

    // Setting the name to nameToSet(name defined by user)
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _setDiscount, parameters: [discountToSet]));
    getDiscount();
  }
}