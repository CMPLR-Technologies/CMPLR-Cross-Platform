import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/models.dart';

class ProfileSearchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ProfileSearchModel profileSearchModel = ProfileSearchModel();

  // controller for the search text field
  final _searchBarController = TextEditingController();

  RxBool showClearSearchBarIcon = false.obs;

  late TabController _tabController;

  int _tabIndex = 0;

  final RxString searchQuery = ''.obs;

  final List<String> popupMenuChoices = [
    'Share',
    'Get notifications',
    'Block',
    'Report',
    'Unfollow'
  ];

  List<Blog>? followingBlogs;

  List<RxBool>? showProfiles;

  // getters for class attributes
  TextEditingController get searchBarController => _searchBarController;

  TabController get tabController => _tabController;

  @override
  void onInit() {
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.index != _tabIndex) {
        searchBarController.text = '';
        searchQueryChanged();
      }
      _tabIndex = _tabController.index;
    });

    super.onInit();
  }

  /// This reads the search query then it display the results in the list view,
  /// this method is called whenever the search query is changed
  void searchQueryChanged() {
    searchQuery.value = _searchBarController.text;
    if (_searchBarController.text == '') {
      showClearSearchBarIcon.value = false;
    } else {
      showClearSearchBarIcon.value = true;
    }
  }

  void submitSearchQuery() {
    if (_tabIndex == 1) {
      if (followingBlogs != null) {
        for (var i = 0; i < followingBlogs!.length; i++) {
          print(_searchBarController.text);
          if (!followingBlogs![i]
              .blogName
              .contains(_searchBarController.text)) {
            showProfiles![i].value = false;
            // print(followingBlogs![i].blogName + ' false');
          } else {
            // print(followingBlogs![i].blogName + ' true');
            showProfiles![i].value = true;
          }
        }
        update();
      }
    }
  }

  void closeSearchPage() {
    Get.back();
  }

  Future<void> share(BuildContext context, String blogURL) async {
    await Share.share(blogURL);
  }
}
