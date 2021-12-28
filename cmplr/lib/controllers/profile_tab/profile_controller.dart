import '../../views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../models/models.dart';
import 'package:share_plus/share_plus.dart';

class ProfileController extends GetxController {
  final _model =
      ModelProfile(blogId: GetStorage().read('user')['primary_blog_id']);

  var blogInfo,
      _blogName,
      _blogTitle,
      _blogAvatar,
      _blogAvatarShape,
      _description,
      _backgroundColor,
      _headerImage,
      _url;

  dynamic get blogName => _blogName;
  dynamic get blogTitle => _blogTitle;
  dynamic get blogAvatar => _blogAvatar;
  dynamic get blogAvatarShape => _blogAvatarShape;
  dynamic get headerImage => _headerImage;
  dynamic get description => _description;
  dynamic get backgroundColor => _backgroundColor;
  dynamic get url => _url;

  var allowSubmissions = false;
  var ask = false;
  var useMedia = false;
  var topPosts = false;
  var optimizeVideo = false;
  var showUploadProg = false;
  var disableDoubleTapToLike = false;

  Future<void> goToSettings() async {
    Get.to(const ProfileSettingsView());
    update();
  }

  Future<void> getBlogInfo() async {
    blogInfo = await _model.getBlogInfo();
    _blogTitle = blogInfo['title'];
    _blogName = blogInfo['blog_name'];
    _blogAvatar = blogInfo['avatar'];
    _blogAvatarShape = blogInfo['avatar_shape'];
    _headerImage = blogInfo['header_image'];
    _description = blogInfo['description'];
    _backgroundColor = blogInfo['background_color'];
    _url = blogInfo['url'];
  }

  Future<void> share(BuildContext context) async {
    await Share.share(_url);
    update();
  }

  Future<void> goBack() async {
    Get.back();
    update();
  }

  Future<void> toggleSubmissions() async {
    allowSubmissions = !allowSubmissions;
    update();
  }

  Future<void> toggleUseMedia() async {
    useMedia = !useMedia;
    update();
  }

  Future<void> toggleAsk() async {
    ask = !ask;
    update();
  }

  Future<void> toggleShowTopPosts() async {
    topPosts = !topPosts;
    update();
  }

  Future<void> toggleDisableDoubleTapToLike() async {
    disableDoubleTapToLike = !disableDoubleTapToLike;
    update();
  }

  Future<void> toggleOptimizeVids() async {
    optimizeVideo = !optimizeVideo;
    update();
  }

  Future<void> toggleShowUploadProg() async {
    showUploadProg = !showUploadProg;
    update();
  }

  Future<void> goToAccountSettings() async {
    Get.to(const AccountSettingsView());
    update();
  }
}
