import 'dart:convert';
import 'package:http/http.dart' as http;

class Home {
  final List<BannerHome> banner;
  final List<Featured> featured;
  final List<Manufacture> manufacture;

  Home(this.banner, this.featured, this.manufacture);

  factory Home.fromJson(Map<String, dynamic> obj) {
    return Home(
      (obj['banner'] as List).map((e) => BannerHome.fromJson(e)).toList(),
      (obj['featured'] as List).map((e) => Featured.fromJson(e)).toList(),
      (obj['manufacture'] as List).map((e) => Manufacture.fromJson(e)).toList(),
    );
  }

  static Future<Home> getHome(String _jwt) async {
    var result = await http.get(
      "https://api.deardiamond.id/config",
      headers: {"Authorization": "Bearer $_jwt"},
    );
    var resultJson = json.decode(result.body);
    return Home.fromJson(resultJson);
  }
}

class BannerHome {
  final String image, url;
  BannerHome(this.image, this.url);

  factory BannerHome.fromJson(Map<String, dynamic> obj) {
    return BannerHome(obj['image'], obj['url']);
  }

  static Future<BannerHome> getBanner(Map<String, dynamic> _banner) async {
    Home.fromJson(_banner);
    return BannerHome.fromJson(_banner);
  }
}

class Featured {
  final String image, name, price, id;

  Featured(this.image, this.name, this.price, this.id);

  factory Featured.fromJson(Map<String, dynamic> obj) {
    return Featured(
      obj['image'],
      obj['name'],
      obj['price'],
      obj['id'],
    );
  }
}

class Manufacture {
  final String name, img;

  Manufacture(this.name, this.img);

  factory Manufacture.fromJson(Map<String, dynamic> obj) {
    return Manufacture(
      obj['name'],
      obj['img'],
    );
  }
}
