

import 'dart:convert';

import 'package:openflutterecommerce/config/server_addresses.dart';
import 'package:openflutterecommerce/data/network/network_param.dart';
import 'package:openflutterecommerce/data/model/part_time_data_model/part_time_model_task_one.dart';
import 'package:openflutterecommerce/data/network/network_request.dart';
import 'package:openflutterecommerce/data/repositories/abstract/part_time_task_one_repository.dart';
import 'package:openflutterecommerce/data/repositories/abstract/part_time_task_one_repository.dart';


import 'package:http/http.dart' as http;
class PatTimeTaskOneRepositoryImpls implements PartTimeTaskOneRepository {
  final http.Client _client;
  PatTimeTaskOneRepositoryImpls() :_client = http.Client();
  @override
  Future<List<Rs>> getCartPartTime() async{
    NetworkRequest _res = NetworkRequest(RequestType.post, ServerAddresses.endpointTaskOne, body: partTimeCallingApi, formData: true);
    final u = await _res.getResult();
    return PartTimeDataModelTaskOne.fromJson(jsonDecode(u.body)).rs;

  }

}