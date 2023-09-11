import 'package:http/http.dart' as http;
import 'dart:convert';

const apiHost = "am.i.mullvad.net";

Future<String> connected() async {
  return get("connected");
}

Future<String> ip() async {
  return get("ip");
}

Future<String> country() async {
  return get("country");
}

Future<String> city() async {
  return get("city");
}

Future<String> j() async {
  return get("json");
}

Future<Status> status() async {
  return Status().update();
}

Future<String> get(String path) async {
  return http.read(Uri.https(apiHost, path)).then((value) {
    return value.replaceAll("\n", "");
  });
}

class Status {
  bool connected = false;
  String ip = "";
  String country = "";
  String city = "";

  Status() {}

  Future<Status> update() async {
    return j().then((value) {
      final o = json.decode(value) as Map<String, dynamic>;
      this.connected = o["mullvad_exit_ip"];
      this.ip = o["ip"];
      this.country = o["country"];
      this.city = o["city"];
      return this;
    });
  }

  @override
  String toString() {
    return "connected: $connected, ip: $ip, country: $country, city: $city";
  }
}
