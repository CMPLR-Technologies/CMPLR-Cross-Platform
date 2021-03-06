import 'package:get/get_rx/src/rx_types/rx_types.dart';

/// reponsible for handling user's notes
class UserNote {
  final noteType;
  final avatarURL;
  final avatarShape;
  final blogName;
  final blogURL;
  final profileTitle;
  final postReply;
  RxBool followed = false.obs;

  UserNote(
      {this.noteType,
      this.avatarURL,
      this.avatarShape,
      this.blogName,
      this.blogURL,
      this.profileTitle,
      this.postReply,
      required this.followed});

  factory UserNote.fromJson(Map<String, dynamic> json) {
    final followedValue = json['follower'] == true ? true.obs : false.obs;
    return UserNote(
      noteType: json['type'],
      avatarURL: json['avatar'],
      avatarShape: json['avatar_shape'],
      blogName: json['blog_name'],
      blogURL: json['blog_url'],
      profileTitle: json['blog_title'],
      postReply: json['content'],
      followed: followedValue,
    );
  }
}
