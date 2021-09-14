import 'dart:convert';
//import 'dart:io';
import 'package:universal_io/io.dart';

import 'package:crmdee/model/product.dart';
import 'package:http/http.dart' as http;

import '../model/result.dart';

class Api {
  static Result check(code, data) {
    if (code == 200) {
      return new Result(data: data, msg: "done");
    } //end if
    else if (code == 405) {
      return new Result(data: null, msg: "method not allow");
    } else if (code == 401) {
      return new Result(data: null, msg: "unauthorized");
    } else if (code == 400) {
      return new Result(data: null, msg: "bad request");
    } else {
      return new Result(data: null, msg: "unknown error");
    }
  } //ef

  //login http
  static Future<Result> loginHttp(
      {required String userName, required String password}) async {
    //1. create a dict
    var map1 = {"userName": userName, "password": password};
    //2. convert from dict to json text
    var jsonText = json.encode(map1);

    //3. get response from http post request
    var res = await http.post(Uri.parse(loginHttpUrl),
        headers: {
          "Content-Type": 'application/json',
          'Accept': 'application/json'
        },
        body: jsonText);
    //4. check response result
    return check(res.statusCode, res.body);
  } //ef

  //standard httpsPost
  static Future<Result> httpsPost({
    required dynamic map1,
    required String url,
    required String token,
  }) async {
    try {
      //1. convert to json text
      var jsonText = utf8.encode(json.encode(map1));

      //3. create client object
      HttpClient client = new HttpClient();

      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      //4. create request object
      HttpClientRequest request = await client.postUrl(Uri.parse(url));

      //5. enable browser credential if target platform is web
      if (request is BrowserHttpClientRequest) {
        request.browserCredentialsMode = true;
      }

      //6. add content type to the header
      request.headers.set('content-type', 'application/json');

      if (token != "") {
        request.headers.set('Authorization', 'Bearer $token');
      } //end if

      //7. add json text to the request
      request.add(jsonText);

      //8. get response from request
      HttpClientResponse res = await request.close();

      String resultText = await res.transform(utf8.decoder).join();

      //9. check response result
      return check(res.statusCode, resultText);
    } catch (e) {
      print('error => $e');
      return Future.error(e);
    }
  } //ef

  static Future<Result> httpsGet({
    required String url,
    required String token,
  }) async {
    //3. create client object
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    //4. create request object
    HttpClientRequest request = await client.getUrl(Uri.parse(url));

    //5. enable browser credential if target platform is web
    if (request is BrowserHttpClientRequest) {
      request.browserCredentialsMode = true;
    }
    //6. add content type to the header
    request.headers.set('content-type', 'application/json');

    if (token != "") {
      request.headers.set('Authorization', 'Bearer $token');
    } //end if

    //7. get response from request
    HttpClientResponse res = await request.close();
    String resultText = await res.transform(utf8.decoder).join();
    //print("==> ${res.statusCode}");
    //print('== $resultText'); //4. check response result
    return check(res.statusCode, resultText);
  } //ef

  //login with https
  static Future<Result> loginHttps({
    required String userName,
    required String password,
  }) async {
    var map1 = {"userName": userName, "password": password};
    var result = await httpsPost(
      map1: map1,
      url: loginHttpsUrl,
      token: "",
    );

    return result;
  } //ef

  //get product information https
  static Future<List<Product>> products(
      {required String token, required bool secure}) async {
    Result result;
    if(secure){
      result = await httpsGet(url: productHttpsUrl, token: token);
    }
    else{
      result = await httpGet(url: productHttpUrl, token: token);

    }
     //print(result);
    var maps = json.decode(result.data) as List;

    return maps.map((e) => Product.fromMap(e)).toList();
  } //ef

   

  static Future<Result> httpGet(
      {required String url, required String token}) async {
    //1. create a dict

    //3. get response from http post request
    var res = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    //4. check response result
    return check(res.statusCode, res.body);
  } //ef

} //ec

String baseUrlHttp = "http://192.168.1.30:1974/";
String baseUrlHttps = "https://192.168.1.30:1975/";
String loginHttpUrl = baseUrlHttp + "api/login";
String loginHttpsUrl = baseUrlHttps + "api/login";
String productHttpsUrl = baseUrlHttps + "api/products";
String productHttpUrl = baseUrlHttp + "api/products";
