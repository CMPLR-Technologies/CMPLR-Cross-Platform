import 'custom_widgets.dart';

import '../../controllers/controllers.dart';
import 'post_sched_menu.dart';
import 'two_nested_circles.dart';
import '../sizing/sizing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritePostOrReblog extends StatelessWidget {
  final model, controller;
  const WritePostOrReblog(this.model, this.controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final visibleKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Sizing.blockSizeVertical * 12,
        leading: IconButton(
          icon: Icon(Icons.close, size: Sizing.blockSize * 6.2),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                top: Sizing.blockSizeVertical * 1.8,
                bottom: Sizing.blockSizeVertical * 1.8),
            child: ActionChip(
              label: Text(
                'Post',
                style: TextStyle(
                  fontSize: Sizing.fontSize * 4.2,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () {},
              backgroundColor: Colors.black26,
            ),
          ),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  constraints: BoxConstraints(
                      // TODO: Make this variable according to schedule
                      maxHeight: Sizing.blockSizeVertical * 60),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Sizing.blockSize * 5)),
                  builder: (BuildContext context) {
                    return GetBuilder<WritePostController>(
                        builder: (controller) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // TODO: Add the bar at the very top
                                //(don't know which icon)
                                SizedBox(height: Sizing.blockSizeVertical * 3),
                                Container(
                                  width: Sizing.blockSize * 12,
                                  height: Sizing.blockSize * 1,
                                  //TODO: Link this to theme
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Sizing.blockSize))),
                                ),
                                SizedBox(height: Sizing.blockSizeVertical * 3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Sizing.blockSize * 38,
                                    ),
                                    Text(
                                      'Post options',
                                      style: TextStyle(
                                        fontSize: Sizing.fontSize * 4.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Sizing.blockSize * 24,
                                    ),
                                    InkWell(
                                      child: Text(
                                        'Done',
                                        style: TextStyle(
                                          fontSize: Sizing.fontSize * 4,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onTap: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Sizing.blockSizeVertical * 3,
                                ),
                                postOption('Post Now', Icons.edit,
                                    controller.isActivated(postOptions.postNow),
                                    () {
                                  controller.setPostOption(postOptions.postNow);
                                }),
                                SizedBox(height: Sizing.blockSizeVertical * 3),
                                scheduleOption(
                                    controller
                                        .isActivated(postOptions.schedule),
                                    controller,
                                    context),
                                SizedBox(height: Sizing.blockSizeVertical * 3),
                                postOption(
                                    'Save as draft',
                                    Icons.drafts_outlined,
                                    controller.isActivated(
                                        postOptions.saveAsDraft), () {
                                  controller
                                      .setPostOption(postOptions.saveAsDraft);
                                }),
                                SizedBox(height: Sizing.blockSizeVertical * 3),
                                postOption(
                                    'Post privately',
                                    Icons.lock_outline,
                                    controller.isActivated(
                                        postOptions.postPrivately), () {
                                  controller
                                      .setPostOption(postOptions.postPrivately);
                                }),
                                SizedBox(height: Sizing.blockSizeVertical * 3),
                                controller.isActivated(
                                            postOptions.saveAsDraft) ||
                                        controller.isActivated(
                                            postOptions.postPrivately)
                                    ? Container()
                                    : shareToTwitter(
                                        controller.isActivated(
                                            postOptions.shareToTwitter),
                                        controller),
                              ],
                            ));
                  },
                );
              },
              icon: Icon(Icons.more_vert, size: Sizing.blockSize * 7.5)),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(Sizing.blockSizeVertical * 6),
          child: Padding(
            padding: EdgeInsets.all(Sizing.blockSize * 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // (Tarek) TODO: Get the user's image and name
                // Can be cached on login
                CircleAvatar(
                    backgroundImage: AssetImage(controller.userAvatar)),
                SizedBox(width: Sizing.blockSize * 2),
                Text(controller.userName,
                    style: TextStyle(
                        fontSize: Sizing.fontSize * 4.2,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                    padding: EdgeInsets.all(Sizing.blockSize * 3),
                    child: Column(
                      children: [
                        SizedBox(height: Sizing.blockSize * 1.2),

                        // The main difference between a post and a reblog
                        if (controller is ReblogController)
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    width: Sizing.blockSize / 20)),
                            child: PostItem(
                              postData: controller.post.postData,
                              name: controller.post.name,
                              hashtags: controller.post.hashtags,
                              numNotes: controller.post.numNotes,
                              profilePhoto: controller.post.profilePhoto,
                              showBottomBar: false,
                            ),
                          ),

                        TextField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Add something, if you\'d like'),
                          maxLines: null,
                          style: TextStyle(
                            decoration: controller.strikethough
                                ? TextDecoration.lineThrough
                                : null,
                            fontWeight: controller.bold
                                ? FontWeight.bold
                                : FontWeight.w400,
                            fontStyle:
                                controller.italic ? FontStyle.italic : null,
                            color: controller.currentColor,
                          ),
                        ),

                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.previews.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller.previews[index];
                            }),

                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.urls.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TextField(
                                controller: controller.urlControllers[index],
                              );
                            }),
                      ],
                    )),
              ],
            ),
          ),
          // TODO: Swap this out to the text editing bottom bar when text
          // is highlighted
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              visibleKeyboard
                  ? Padding(
                      padding: EdgeInsets.only(left: Sizing.blockSize * 3),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add tags to help people find your post',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizing.fontSize * 3.715),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey[900] ?? Colors.red),
                              shape: MaterialStateProperty.all(
                                  const StadiumBorder())),
                          onPressed: () {},
                        ),
                      ),
                    )
                  : SizedBox(
                      height: Sizing.blockSizeVertical * 0.1,
                    ),
              SizedBox(height: Sizing.blockSizeVertical * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < controller.allColors.length; i++)
                    InkWell(
                      child: TwoNestedCircles(
                          Colors.white, controller.allColors[i], 7.25, 5),
                      onTap: () {
                        controller.changeColor(i);
                      },
                    ),
                ],
              ),
              SizedBox(height: Sizing.blockSizeVertical),
              Padding(
                padding: EdgeInsets.only(
                    left: Sizing.blockSize * 3, right: Sizing.blockSize * 3),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.addLink();
                      },
                      icon: const Icon(Icons.link),
                    ),
                    const Spacer(),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.image)),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          controller.toggleBold();
                        },
                        icon: const Icon(Icons.format_bold)),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          controller.toggleItalic();
                        },
                        icon: const Icon(Icons.format_italic)),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          controller.toggleStrikethrough();
                        },
                        icon: const Icon(Icons.strikethrough_s)),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.tag),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
