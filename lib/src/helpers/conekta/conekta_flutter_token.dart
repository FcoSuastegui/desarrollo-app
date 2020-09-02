import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;
import 'package:device_info/device_info.dart';
import 'package:midesarrollo/src/helpers/conekta/conekta_model.dart';
import 'package:midesarrollo/src/helpers/conekta/payment_model.dart';
import 'package:midesarrollo/src/helpers/network.dart';


class ConektaFlutterTokenizer {

  // Pruebas
  //String _publickey = "key_FQiq5kmy33L3TziACV7r6qA";
  // Produccion
  //String _publickey = "key_Yrs96Z6pPsUCD9ouWrsoi7Q";
  String _conektaTokenizationApiUrl = "https://api.conekta.io/tokens";

  dynamic _buildConektaTokenizeRequestHeaders() async => 
  {
    "Accept": "application/vnd.conekta-v1.0.0+json",
    "Conekta-Client-User-Agent":
        "{\"agent\": \"Conekta JavascriptBindings-AJAX/v1.0.0 build 2.0.14\"}",
    "Authorization": "Basic " + await this._encodeKey()
  };

  Future<String> _encodeKey() async {
    String _publicKeys =  await this._getPublicKey();
    List<int> utf16KeyBytes = _publicKeys.codeUnits;
    return Base64Encoder().convert(utf16KeyBytes);
  }

  Future<String> _getPublicKey() async {
    final response = await Network.instance.post('app/conektaKey', {});
    if( response.statusCode == 200 ) {
      Map<dynamic, dynamic> body = response.data;
      return body['publicKey'];
    }
    return "";
  }

  Future<String> _getDeviceId() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      return androidDeviceInfo.androidId;
    }

    IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    return iosDeviceInfo.identifierForVendor;
  }

  dynamic _buildUrlEncodedForm(PaymentMethod paymentMethod) async {
    String deviceId = await this._getDeviceId();

    return {
      "card[name]": paymentMethod.name,
      "card[number]": paymentMethod.number,
      "card[exp_month]": paymentMethod.expirationMonth,
      "card[exp_year]": paymentMethod.expirationYear,
      "card[cvc]": paymentMethod.cvc,
      "card[device_fingerprint]": deviceId
    };
  }

  Future<dynamic> tokenizePaymentMethod(PaymentMethod paymentMethod) async {
    dynamic requestHeaders = await this._buildConektaTokenizeRequestHeaders();
    dynamic requestBody = await this._buildUrlEncodedForm(paymentMethod);

    var conektaResponse = await http.post(this._conektaTokenizationApiUrl,
        headers: requestHeaders, body: requestBody);

    if (conektaResponse.statusCode == 200) {
      return ConektaModel.fromJson(json.decode(conektaResponse.body));
    }

    if(conektaResponse.statusCode == 422 ) {
      return ConektaModel.fromJson(json.decode(conektaResponse.body));
    }

    return null;
  }
    
}