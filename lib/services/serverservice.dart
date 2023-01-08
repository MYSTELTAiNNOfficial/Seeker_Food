part of 'services.dart';

// Server Database Service

class ServerService {
  static Future<http.Response> login(
      String name, String email, String uid) async {
    var url = Uri.parse('https://${ConstAPI.baseUrl}/index.php/api/user/login');
    var body = jsonEncode({"name": name, "email": email, "uid": uid});
    var response = await http.post(url, body: body, headers: {
      "Content-Type": "application/json",
      "api-key": ConstAPI.guestKey,
    });

    return response;
  }

  static Future<List<DataUser>> getUserProfile() async {
    var key = await AuthService.getUid();
    var url =
        Uri.parse('https://${ConstAPI.baseUrl}/index.php/api/user/profile');
    var response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "api-key": key,
    });

    List<DataUser> data = [];
    var json = jsonDecode(response.body);
    data = (json['data'] as List).map((e) => DataUser.fromJson(e)).toList();
    return data;
  }

  static Future<http.Response> updateProfile(String name, String phone) async {
    var key = await AuthService.getUid();
    var response = await http.post(
      Uri.parse("https://${ConstAPI.baseUrl}/index.php/api/user/edit"),
      headers: {
        "Content-Type": "application/json",
        "api-key": key,
      },
      body: jsonEncode(
        <String, String>{
          "name": name,
          "phone": phone,
        },
      ),
    );

    var job = json.decode(response.body);
    return response;
  }

  static Future<List<Catering>> getAllCatering() async {
    var key = await AuthService.getUid();
    var url = Uri.parse('https://${ConstAPI.baseUrl}/index.php/api/store/all');
    var response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "api-key": key,
    });

    List<Catering> data = [];
    var json = jsonDecode(response.body);
    data =
        (json['all_stores'] as List).map((e) => Catering.fromJson(e)).toList();
    return data;
  }

  static Future<List<CateringDetail>> getCateringDetail(dynamic id) async {
    var key = await AuthService.getUid();
    var url =
        Uri.parse('https://${ConstAPI.baseUrl}/index.php/api/store/detail');
    var body = jsonEncode({"id": id});
    var response = await http.post(url,
        body: body,
        headers: {'Content-Type': 'application/json', 'api-key': key});

    List<CateringDetail> data = [];
    var json = jsonDecode(response.body);
    data = (json['detail'] as List)
        .map((e) => CateringDetail.fromJson(e))
        .toList();
    return data;
  }
}
