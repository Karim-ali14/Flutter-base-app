
import 'dart:convert';
import 'dart:io';
import 'package:base_flutter_app/features/auth/data/models/user_model.dart';
import 'package:base_flutter_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'dart:developer' as developer;
import '../Localization/AppLocalizations.dart';
import '../models/ResponseModel.dart';
import 'api_endpoints.dart';

class HttpOperations {
  final Ref ref;
  String? userToken;

  HttpWithMiddleware httpLog = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);

  HttpOperations(this.ref);

  Future<ResponseModel> postData({required String endPoint,bool authorized = false,Map? data, String params = ""}) async {
    try{
      final response = await httpLog.post(
        Uri.parse(mainAppUrl + endPoint + (params)),
        headers:authorized ? <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $userToken',
          "Accept" : "application/json",
          'lang' : AppLocalizations.globalLocale?.languageCode ?? "en"
        } :
        {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept" : "application/json",
          'lang' : AppLocalizations.globalLocale?.languageCode ?? "en"
        },
        body: json.encode(data ?? {}),
      );

      developer.log(
        '${response.request}',
        name: 'Request',
      );

      developer.log(
        '$data',
        name: 'RequestBody',
      );
      developer.log(
        _getPrettyJSONString(json.decode(response.body)),
        name: 'Response',
      );

      return ResponseModel.fromJson(jsonDecode(response.body));

    }catch(e){
      print(e);
      developer.log(
        e.toString(),
        name: 'Err',
      );

      return ResponseModel(responseState: ResponseState.Error,isSuccess: false,message: e.toString());
    }
  }

  Future<ResponseModel> getData({required String endPoint,bool authorized = false, String params = ""}) async {

    try{
      final response = await httpLog.get(
        Uri.parse(mainAppUrl + endPoint + (params)),
        headers:authorized ? <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $userToken',
          "Accept" : "application/json",
          'lang' : AppLocalizations.globalLocale?.languageCode ?? "en"
        } :
        {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept" : "application/json",
          'lang' : AppLocalizations.globalLocale?.languageCode ?? "en"
        },
      );
      developer.log(
        '${response.request}',
        name: 'Request',
      );
      developer.log(
        _getPrettyJSONString(json.decode(response.body)),
        name: 'Response',
      );
      return ResponseModel.fromJson(json.decode(response.body));
    }catch(e){
      print("HTTP Error $e");

      return ResponseModel(responseState: ResponseState.Error,isSuccess: false,message: e.toString());
    }
  }

  Future<ResponseModel> deleteData({required String endPoint,bool authorized = false, String params = ""}) async {

    try{
      final response = await httpLog.delete(
        Uri.parse(mainAppUrl + endPoint + (params)),
        headers:authorized ? <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $userToken',
          "Accept" : "application/json",
          'lang' : AppLocalizations.globalLocale?.languageCode ?? "en"
        } :
        {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept" : "application/json",
          'lang' : AppLocalizations.globalLocale?.languageCode ?? "en"
        },
      );
      developer.log(
        '${response.request}',
        name: 'Request',
      );
      developer.log(
        _getPrettyJSONString(json.decode(response.body)),
        name: 'Response',
      );
      return ResponseModel.fromJson(json.decode(response.body));
    }catch(e){
      print("HTTP Error $e");

      return ResponseModel(responseState: ResponseState.Error,isSuccess: false,message: e.toString());
    }
  }

  Future<ResponseModel> postFormData({required String endPoint,bool authorized = false,required Map<String,String> data,List<http.MultipartFile>? files, String params = ""}) async {
    try{
      var postUri = Uri.parse(mainAppUrl + endPoint + params);
      http.MultipartRequest request =  http.MultipartRequest("POST", postUri);
      print("User Token $userToken");
      request.headers.addAll(authorized ? <String, String> {
        'Authorization': 'Bearer $userToken',
        'Content-Type': 'multipart/form-data;',
        'Accept': 'application/json',
        'lang' : AppLocalizations.globalLocale?.languageCode ?? "en"
      } :
      {
        'Content-Type': 'multipart/form-data;',
        'Accept': 'application/json',
        'lang' : AppLocalizations.globalLocale?.languageCode ?? "en"
      },);

      request.fields.addAll(data);

      if(files != null)
        request.files.addAll(files);

      final response = await request.send();
      var responseBody = await http.Response.fromStream(response);

      developer.log(
        '${response.request}',
        name: 'Request',
      );

      developer.log(
        '${request.fields} , ${request.files}',
        name: 'RequestBody',
      );

      print(response.statusCode);
      developer.log(
        '${response.request}',
        name: 'Request',
      );
      developer.log(
        _getPrettyJSONString(json.decode(responseBody.body)),
        name: 'Response',
      );

      return ResponseModel.fromJson(jsonDecode(responseBody.body));

    }catch(e){
      print(e);
      developer.log(
        e.toString(),
        name: 'Err',
      );
      return ResponseModel(responseState: ResponseState.Error,isSuccess: false,message: e.toString());
    }
  }

  static String _getPrettyJSONString(jsonObject){
    var encoder = const JsonEncoder.withIndent("     ");
    return encoder.convert(jsonObject);
  }
}