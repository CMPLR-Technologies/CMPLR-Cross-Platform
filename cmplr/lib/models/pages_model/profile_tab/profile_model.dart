import 'package:get/get_connect/http/src/utils/utils.dart';
import 'dart:convert';
import '../../../backend_uris.dart';

import '../../cmplr_service.dart';

class ModelProfile {
  var blogId;
  ModelProfile({required this.blogId}) {}

  Future<dynamic> getBlogInfo() async {
    final response = await CMPLRService.get('/blog/info', {});
    final responseBody = jsonDecode(response.body);
    return responseBody['response'];
  }

  Future<dynamic> getTheme() async {
    final response = await CMPLRService.get('/user_theme', {});
    final responseBody = jsonDecode(response.body);
    return responseBody['response'];
  }

  Future<void> putTheme() async {}
}
