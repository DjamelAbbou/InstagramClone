// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class CreateNewPostView extends HookConsumerWidget {
  const CreateNewPostView({
    Key? key,
    required this.fileToPost,
    required this.fileType,
  }) : super(key: key);

  final File fileToPost;

  final FileType fileType;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      createNewPostView(
        _ref,
        _context,
        fileToPost: fileToPost,
        fileType: fileType,
      );
}
