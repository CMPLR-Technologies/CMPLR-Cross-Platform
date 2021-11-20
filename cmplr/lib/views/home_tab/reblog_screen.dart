import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/controllers.dart';
import '../../utilities/external/external.dart';

// TODO: DRAFTS
class ReblogView extends StatelessWidget {
  const ReblogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReblogController>(
      init: ReblogController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: TextButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    'Reblog',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.lightBlue[400] ?? Colors.blue),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
              ),
            ),
            IconButton(
                onPressed: () {
                  // https://api.flutter.dev/flutter/material/showModalBottomSheet.html
                },
                icon: const Icon(Icons.more_vert))
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // (Tarek) TODO: Get the user's image and name
                  // Can be cached on login
                  const CircleAvatar(
                      backgroundImage: AssetImage(
                          'lib/utilities/assets/logo/logo_icon.png')),
                  const SizedBox(width: 8),
                  const Text('Username',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 600,
                            child: Container(
                              child: const Center(child: Text('Post')),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  border: Border.all(
                                      color: Colors.grey.shade900, width: 2)),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            focusNode: controller.textFocus,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Add something, if you\'d like'),
                          ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Add tags to help people find your post',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[900] ?? Colors.red),
                          shape:
                              MaterialStateProperty.all(const StadiumBorder())),
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    children: [
                      FocusedMenuHolder(
                          menuOffset: 10,
                          menuItemExtent: 40,
                          duration: const Duration(milliseconds: 200),
                          menuWidth: 120,
                          blurSize: 0,
                          maxMenuHeightPercentage: 0.9,
                          animateMenuItems: false,
                          onPressed: () {
                            controller.focusOnText();
                          },
                          blurBackgroundColor:
                              const Color.fromRGBO(0, 10, 26, 0),
                          openWithTap: false,
                          menuItems: controller.textModes.keys
                              .map((e) => FocusedMenuItem(
                                  title: Text(
                                    e.toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    controller.setMode(e);
                                  }))
                              .toList(),
                          child: const Icon(Icons.text_fields)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.link)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.gif)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.image)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.headphones)),
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
      ),
    );
  }
}