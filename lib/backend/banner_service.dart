import 'dart:convert';

import 'package:http/http.dart' as http;


class BannerService {


  Future<List<dynamic>> getAllBanner() async {
    http.Response response = await http.get(
        Uri.parse("http://194.233.69.10/lms/ajax.php?action=get_banner"));
    List<dynamic> imageList = [];
    final body = jsonDecode(response.body);
    if(body['success'] == 1){
      imageList = body['banners'];
    }
    return imageList;
  }
}