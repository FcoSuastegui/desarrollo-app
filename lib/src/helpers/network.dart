
import 'package:dio/dio.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';

class Network {
  Network._internal();
  static Network _instance = Network._internal();
  static Network get instance => _instance;


  post(String route, Map data) async => await Dio().post("${GetStorages.instance.server}/$route", data: data );
  get(String route) async => await Dio().get("${GetStorages.instance.server}/$route");
  postFormData(String route, Map<String, dynamic> data) async => await Dio().post("${GetStorages.instance.server}/$route", data: FormData.fromMap(data));

}