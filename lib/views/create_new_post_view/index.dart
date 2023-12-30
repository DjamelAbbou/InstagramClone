import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/auth/providers/user_id.dart';
import 'package:instagram_clone/state/image_upload/models/file_type.dart';
import 'package:instagram_clone/state/image_upload/models/thumbnail_request.dart';
import 'package:instagram_clone/state/image_upload/notifiers/image_upload.dart';
import 'package:instagram_clone/state/post_settings/models/post_settings.dart';
import 'package:instagram_clone/state/post_settings/notifiers/post_settings.dart';
import 'package:instagram_clone/views/components/constants/strings.dart';
import 'package:instagram_clone/views/components/file_thumbnail.dart';
import 'package:intl/intl.dart';

part 'index.g.dart';

@hcwidget
Widget createNewPostView(
  WidgetRef ref,
  BuildContext context, {
  required File fileToPost,
  required FileType fileType,
}) {
  final thumbnailRequest = ThumbnailRequest(
    file: fileToPost,
    fileType: fileType,
  );

  final postSettings = ref.watch(postSettingNotifierProvider);
  final postController = useTextEditingController();
  final bidPriceController = useTextEditingController();
  final bidEndingDate = useState('');
  final mounted = useIsMounted();
  final isPostButtonEnabled = useState(false);
  useEffect(() {
    void listener() {
      isPostButtonEnabled.value = postController.text.isNotEmpty &&
          bidPriceController.text.isNotEmpty &&
          bidEndingDate.value.isNotEmpty;
    }

    postController.addListener(listener);
    bidPriceController.addListener(listener);
    bidEndingDate.addListener(listener);

    return () {
      postController.removeListener(listener);
      bidPriceController.removeListener(listener);
      bidEndingDate.removeListener(listener);
    };
  }, [postController, bidPriceController, bidEndingDate]);
  return Scaffold(
    appBar: AppBar(
      title: const Text(Strings.createNewPost),
      actions: [
        IconButton(
          onPressed: isPostButtonEnabled.value
              ? () async {
                  final userId = ref.read(userIdProvider);
                  if (userId == null) {
                    return;
                  }
                  final message = postController.text;
                  final bidPrice = bidPriceController.text;
                  final isUploaded = await ref
                      .read(imageUploadNotifierProvider.notifier)
                      .upload(
                        file: fileToPost,
                        fileType: fileType,
                        message: message,
                        bidPrice: bidPrice,
                        bidEndingDate: bidEndingDate.value,
                        postSettings: postSettings,
                        userId: userId,
                      );

                  if (isUploaded && context.mounted) {
                    Navigator.of(context).pop();
                  }
                }
              : null,
          icon: Icon(
            Icons.send,
            color: isPostButtonEnabled.value ? Colors.blue[400] : null,
          ),
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FileThumbnailView(request: thumbnailRequest),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  labelText: Strings.pleaseWriteYourMessageHere),
              autofocus: true,
              maxLines: null,
              controller: postController,
            ),
          ),
          ...PostSetting.values.map((postSetting) => ListTile(
                title: Text(postSetting.title),
                subtitle: Text(postSetting.description),
                trailing: Switch(
                  value: postSettings[postSetting] ?? false,
                  onChanged: (isOn) {
                    ref
                        .read(postSettingNotifierProvider.notifier)
                        .setSetting(postSetting, isOn);
                  },
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  labelText: Strings.pleaseEnterYourStartingBidPrice),
              controller: bidPriceController,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2024),
                ).then((value) => bidEndingDate.value = value.toString());
              },
              child: Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Colors.purple[100],
                    size: 35,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    Strings.chooseEndingDate,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
  );
}
