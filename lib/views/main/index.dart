import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/auth/notifiers/auth_state_notifier.dart';
import 'package:instagram_clone/state/image_upload/helpers/image_picker.dart';
import 'package:instagram_clone/state/image_upload/models/file_type.dart';
import 'package:instagram_clone/state/post_settings/notifiers/post_settings.dart';
import 'package:instagram_clone/views/components/dialogs/alert.dart';
import 'package:instagram_clone/views/components/dialogs/logout.dart';
import 'package:instagram_clone/views/create_new_post_view/index.dart';
import 'package:instagram_clone/views/tabs/user_posts/user_posts_view.dart';

part 'index.g.dart';

final bodies = [
  Container(
    color: Colors.red,
  ),
  Container(
    color: Colors.blue,
  ),
  Container(
    color: Colors.orange,
  ),
  Container(
    color: Colors.yellow,
  ),
];

@hcwidget
Widget mainView(BuildContext context, WidgetRef ref) {
  final currentPageIndex = useState<int>(1);
  final mounted = useIsMounted();
  return DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text("Auction App"),
        actions: [
          IconButton(
            onPressed: () async {
              final imageFile = await ImagePickerHelper.pickImageFromGallery();
              if (imageFile == null) {
                return;
              }

              ref.refresh(postSettingNotifierProvider);

              //go to screen of creating new post
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostView(
                      fileToPost: imageFile,
                      fileType: FileType.image,
                    ),
                  ),
                );
              } else {
                return;
              }
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () async {
              final shouldLogOut =
                  await const LogoutDialog().present(context).then(
                        (value) => value ?? false,
                      );
              if (shouldLogOut) {
                ref.read(authStateNotifierProvider.notifier).logOut();
              }
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
          NavigationDestination(
            label: 'Search',
            icon: Icon(Icons.search),
          ),
        ],
        selectedIndex: currentPageIndex.value,
        onDestinationSelected: (int index) {
          currentPageIndex.value = index;
        },
      ),
      body: const [
        UserPostsView(),
        UserPostsView(),
        UserPostsView()
      ][currentPageIndex.value],
    ),
  );
}
