import 'package:get_storage/get_storage.dart';

import '../../flags.dart';
import '../../backend_uris.dart';
import 'package:getwidget/getwidget.dart';
import '../../models/models.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';
import '../../utilities/sizing/sizing.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import '../../controllers/controllers.dart';
import '../../utilities/custom_widgets/custom_widgets.dart';
import '../../views/views.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => FutureBuilder(
          future: controller.getBlogInfo(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return DefaultTabController(
                length: 3,
                child: Scaffold(
                  backgroundColor: Get.theme.scaffoldBackgroundColor,
                  body: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          stretch: true,
                          backgroundColor: controller.backgroundColor,
                          expandedHeight: Sizing.blockSizeVertical * 50,
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.pin,
                            background: Stack(
                              children: [
                                GestureDetector(
                                  key: const ValueKey('Profile_Header'),
                                  onTap: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        constraints: BoxConstraints(
                                          maxHeight:
                                              Sizing.blockSizeVertical * 10,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                Sizing.blockSize * 5)),
                                        builder: (BuildContext context) {
                                          return Padding(
                                            padding: EdgeInsets.fromLTRB(
                                              Sizing.blockSize * 4,
                                              0,
                                              0,
                                              0,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  key: const ValueKey('Profile_'
                                                      'ChangeHeader'),
                                                  onTap: () async {
                                                    await controller
                                                        .pickHeader();
                                                    controller.getImgUrl(true);
                                                  },
                                                  child: SizedBox(
                                                    width:
                                                        Sizing.blockSize * 100,
                                                    height: Sizing
                                                            .blockSizeVertical *
                                                        5,
                                                    child: const Text(
                                                        'Change your header'
                                                        ' image'),
                                                  ),
                                                ),
                                                InkWell(
                                                  key: const ValueKey('Profile_'
                                                      'ViewHeader'),
                                                  onTap: () {
                                                    Get.to(FadeInImage
                                                        .assetNetwork(
                                                      placeholder:
                                                          'lib/utilities/assets/logo/cmplr_logo_icon.png',
                                                      image: controller
                                                          .headerImage,
                                                      fit: BoxFit.fitWidth,
                                                    ));
                                                  },
                                                  child: SizedBox(
                                                    width:
                                                        Sizing.blockSize * 100,
                                                    height: Sizing
                                                            .blockSizeVertical *
                                                        5,
                                                    child: const Text(
                                                      'view your header'
                                                      ' image',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'lib/utilities/assets/logo/cmplr_logo_icon.png',
                                    image: controller.headerImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: Sizing.blockSizeVertical * 24,
                                  left: Sizing.blockSize * 40,
                                  child: (controller.blogAvatarShape ==
                                          'circle')
                                      ? InkWell(
                                          key: const ValueKey('Profile_Avatar'),
                                          onTap: () {
                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                constraints: BoxConstraints(
                                                  maxHeight:
                                                      Sizing.blockSizeVertical *
                                                          10,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Sizing.blockSize *
                                                                5)),
                                                builder:
                                                    (BuildContext context) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      Sizing.blockSize * 4,
                                                      0,
                                                      0,
                                                      0,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        InkWell(
                                                          key: const ValueKey(
                                                              'Profile_'
                                                              'ChangeAvatar'),
                                                          onTap: () async {
                                                            await controller
                                                                .pickAvatar();
                                                            controller
                                                                .getImgUrl(
                                                                    false);
                                                          },
                                                          child: SizedBox(
                                                            width: Sizing
                                                                    .blockSize *
                                                                100,
                                                            height: Sizing
                                                                    // ignore: lines_longer_than_80_chars
                                                                    .blockSizeVertical *
                                                                5,
                                                            child: const Text(
                                                                'Change your'
                                                                ' Avatar'),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          key: const ValueKey(
                                                              'Profile_'
                                                              'ViewAvatar'),
                                                          onTap: () {
                                                            Get.to(FadeInImage
                                                                .assetNetwork(
                                                              placeholder:
                                                                  'lib/utilities/assets/logo/cmplr_logo_icon.png',
                                                              image: controller
                                                                  .blogAvatar,
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                            ));
                                                          },
                                                          child: SizedBox(
                                                            width: Sizing
                                                                    .blockSize *
                                                                100,
                                                            height: Sizing
                                                                    // ignore: lines_longer_than_80_chars
                                                                    .blockSizeVertical *
                                                                5,
                                                            child: const Text(
                                                              'View your'
                                                              ' Avatar',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          child: ClipOval(
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  'lib/utilities/assets/logo/cmplr_logo_icon.png',
                                              image: controller.blogAvatar,
                                              height: Sizing.blockSize * 20,
                                              width: Sizing.blockSize * 20,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          key: const ValueKey('Profile_Avatar'),
                                          onTap: () {
                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                constraints: BoxConstraints(
                                                  maxHeight:
                                                      Sizing.blockSizeVertical *
                                                          10,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Sizing.blockSize *
                                                                5)),
                                                builder:
                                                    (BuildContext context) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      Sizing.blockSize * 4,
                                                      0,
                                                      0,
                                                      0,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        InkWell(
                                                          key: const ValueKey(
                                                              'Profile_'
                                                              'ChangeAvatar'),
                                                          onTap: () {},
                                                          child: SizedBox(
                                                            width: Sizing
                                                                    .blockSize *
                                                                100,
                                                            height: Sizing
                                                                    // ignore: lines_longer_than_80_chars
                                                                    .blockSizeVertical *
                                                                5,
                                                            child: const Text(
                                                                'Change your'
                                                                ' Avatar'),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          key: const ValueKey(
                                                              'Profile_'
                                                              'ViewAvatar'),
                                                          onTap: () {},
                                                          child: SizedBox(
                                                            width: Sizing
                                                                    .blockSize *
                                                                100,
                                                            height: Sizing
                                                                    // ignore: lines_longer_than_80_chars
                                                                    .blockSizeVertical *
                                                                5,
                                                            child: const Text(
                                                              'View your'
                                                              ' Avatar',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          child: ClipRect(
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  'lib/utilities/assets/logo/cmplr_logo_icon.png',
                                              image: controller.blogAvatar ??
                                                  placeHolderImgUrl,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      Sizing.blockSize * 4,
                                      Sizing.blockSizeVertical * 5,
                                      Sizing.blockSize * 4,
                                      0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          controller.blogName ?? '',
                                          style: TextStyle(
                                            fontSize: Sizing.fontSize * 3.5,
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              key: const ValueKey('Profile_'
                                                  'Search'),
                                              icon: const Icon(Icons.search),
                                              onPressed: () {
                                                Get.to(ProfileSearch());
                                              },
                                            ),
                                            IconButton(
                                              key: const ValueKey('Profile_'
                                                  'EditProfile'),
                                              icon:
                                                  const Icon(Icons.color_lens),
                                              onPressed: () {
                                                controller.goToEdit();
                                              },
                                            ),
                                            IconButton(
                                              key: const ValueKey('Profile_'
                                                  'Share'),
                                              icon: const Icon(Icons.share),
                                              onPressed: () {
                                                controller.share(context);
                                              },
                                            ),
                                            IconButton(
                                              key: const ValueKey('Profile_'
                                                  'Settings'),
                                              icon: const Icon(Icons.settings),
                                              onPressed: () {
                                                controller.goToSettings();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned.fill(
                                  top: Sizing.blockSizeVertical * 38,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(
                                          controller.blogTitle ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: Sizing.fontSize * 7,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                (controller.backgroundColor ==
                                                        Colors.white)
                                                    ? Colors.black
                                                    : Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                Sizing.blockSizeVertical * 0.5),
                                        Text(
                                          controller.description,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: Sizing.fontSize * 3.5,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                (controller.backgroundColor ==
                                                        Colors.white)
                                                    ? Colors.black
                                                    : Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          forceElevated: innerBoxIsScrolled,
                          bottom: TabBar(
                            indicatorColor:
                                (controller.backgroundColor == Colors.blue)
                                    ? Colors.black
                                    : Colors.blue,
                            tabs: <Tab>[
                              Tab(
                                key: const ValueKey('Profile_PostsTab'),
                                child: Text(
                                  'Posts',
                                  style: TextStyle(
                                      color: (controller.backgroundColor ==
                                              Colors.blue)
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                              ),
                              Tab(
                                key: const ValueKey('Profile_LikesTab'),
                                child: Text(
                                  'Likes',
                                  style: TextStyle(
                                      color: (controller.backgroundColor ==
                                              Colors.blue)
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                              ),
                              Tab(
                                key: const ValueKey('Profile_FollowingTab'),
                                child: Text(
                                  'Following',
                                  style: TextStyle(
                                      color: (controller.backgroundColor ==
                                              Colors.blue)
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                    body: TabBarView(
                      children: <Widget>[
                        PostFeed(
                          getTag: 'ProfileViewPosts',
                          blogName: GetStorage().read('user')['blog_name'],
                          postFeedTypePage: GetURIs.postByName,
                          prefix: 'ProfileViewPosts',
                        ),
                        PostFeed(
                          getTag: 'ProfileViewLikesRecent',
                          postFeedTypePage: GetURIs.userLikes,
                          prefix: 'ProfileViewLikesRecent',
                        ),
                        FutureBuilder(
                            future: controller.getFollowingBlogs(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return ListView.builder(
                                    itemCount:
                                        controller.followingBlogs!.length,
                                    itemBuilder: (context, index) {
                                      return buildBlogsListTile(
                                          controller.followingBlogs![index],
                                          index,
                                          context,
                                          controller);
                                    });
                              } else {
                                return const Expanded(
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.purple,
                                    ),
                                  ),
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              );
            }
          }),
    );
  }

  Widget buildBlogsListTile(Blog blog, int index, BuildContext context,
      ProfileController controller) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        print('User profile tapped');
      },
      child: Container(
        height: Sizing.blockSizeVertical * 9.75,
        padding: EdgeInsets.fromLTRB(
            Sizing.blockSize * 3.71,
            Sizing.blockSizeVertical * 1.5,
            Sizing.blockSize * 1.24,
            Sizing.blockSizeVertical * 1.5),
        child: Stack(
          children: [
            Row(
              children: [
                blog.avatarShape == 'circle'
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(blog.avatarURL),
                        radius: Sizing.blockSize * 4.45,
                      )
                    : GFAvatar(
                        backgroundImage: NetworkImage(blog.avatarURL),
                        shape: GFAvatarShape.square,
                        backgroundColor: Colors.white,
                        size: Sizing.blockSize * 5.9,
                      ),
                SizedBox(width: Sizing.blockSize * 3.71),
                SizedBox(
                  width: Sizing.blockSize * 55.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.blogName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: Sizing.fontSize * 4.2,
                            fontWeight: FontWeight.w500,
                            color: Get.theme.textTheme.bodyText1?.color),
                      ),
                      Text(
                        blog.profileTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: Sizing.fontSize * 4.2,
                            fontWeight: FontWeight.w400,
                            color: Get.theme.textTheme.bodyText1?.color),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: Sizing.blockSize * 5.9),
              ],
            ),
            Positioned(
              child: Obx(
                () => Center(
                  child: controller.followingBlogs![index].following.value
                      ? PopupMenuButton(
                          key: ValueKey('Profile_following_${index}'),
                          icon: const Icon(Icons.person),
                          onSelected: (choice) {
                            print(choice);
                            popupMenuChoiceAction(
                                choice, index, context, controller);
                          },
                          itemBuilder: (context) {
                            return controller.popupMenuChoices.map((choice) {
                              return PopupMenuItem<String>(
                                key: ValueKey('Profile_following_'
                                    '${index}_${choice}'),
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        )
                      : Material(
                          color: Colors.transparent,
                          child: InkWell(
                            key: ValueKey('Profile_following_${index}_follow'),
                            onTap: () {
                              controller.followingBlogs![index].following
                                  .value = true;
                              controller.searchModel.followBlog(
                                  controller.followingBlogs![index].blogName);
                            },
                            child: Container(
                              height: Sizing.blockSizeVertical * 6.75,
                              padding: EdgeInsets.fromLTRB(
                                  Sizing.blockSize * 2.5,
                                  0,
                                  Sizing.blockSize * 2.5,
                                  0),
                              child: Center(
                                child: Text(
                                  'Follow',
                                  style: TextStyle(
                                      fontSize: Sizing.fontSize * 4.65,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.lightBlue),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              right: 0,
            ),
          ],
        ),
      ),
    );
  }

  void popupMenuChoiceAction(
      choice, int index, BuildContext context, ProfileController controller) {
    switch (choice) {
      case 'Share':
        {
          controller.shareFollowing(
              context, controller.followingBlogs![index].blogURL);
          break;
        }
      case 'Get notifications':
        {
          break;
        }
      case 'Block':
        {
          break;
        }
      case 'Report':
        {
          break;
        }
      case 'Unfollow':
        {
          print(index);
          controller.followingBlogs![index].following.value = false;
          controller.searchModel
              .unfollowBlog(controller.followingBlogs![index].blogName);
          break;
        }
    }
  }
}
