import 'package:http/http.dart' as http;

class WebService {
  static Future getQod(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }

  static Future motivational(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }

  static Future sports(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }

  static Future happy(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }

  static Future sad(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }

  static Future funny(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }

  static Future popular(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }
}
