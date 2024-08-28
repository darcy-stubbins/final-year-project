import 'dart:convert';
import 'dart:io';

class Api {
  //post to the api
  Future<String> post(String url, Map<String, String> data) async {
    String urlEncodedData = '';
    data.forEach((key, value) {
      urlEncodedData += key + '=' + value + '&';
    });
    List<String> dataChars = urlEncodedData.split("");
    dataChars.removeLast();
    urlEncodedData = dataChars.join();
    try {
      HttpClient httpClient = new HttpClient();
      httpClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set(HttpHeaders.contentTypeHeader,
          "application/x-www-form-urlencoded; charset=UTF-8");

      // request.write(urlEncodedData);
      request.write(urlEncodedData);
      // print(urlEncodedData);
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      if (response.statusCode == HttpStatus.ok) {
        return responseBody;
      }
    } catch (e) {
      print("fail：$e");
    }
    return '[]';
  }

  //get from the api
  Future<String> get(String url) async {
    try {
      HttpClient httpClient = new HttpClient();
      httpClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      if (response.statusCode == HttpStatus.ok) {
        return responseBody;
      }
    } catch (e) {
      print("fail：$e");
    }
    return '[]';
  }
}
