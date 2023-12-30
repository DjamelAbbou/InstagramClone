import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/image_upload/models/thumbnail_request.dart';
import 'package:instagram_clone/state/image_upload/providers/thumbnail.dart';
import 'package:instagram_clone/views/components/animations/loading_view.dart';
import 'package:instagram_clone/views/components/animations/small_error_view.dart';

part 'file_thumbnail.g.dart';

@cwidget
Widget fileThumbnailView(WidgetRef ref,
    {required final ThumbnailRequest request}) {
  final thumbnail = ref.watch(
    thumbnailProvider(request),
  );
  return thumbnail.when(
    data: (imageWithAspectRatio) {
      return AspectRatio(
        aspectRatio: imageWithAspectRatio.aspectRatio,
        child: imageWithAspectRatio.image,
      );
    },
    error: (error, stackTrack) => const SmallErrorAnimationView(),
    loading: () => const LoadingAnimationView(),
  );
}
