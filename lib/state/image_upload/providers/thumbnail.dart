import 'package:flutter/material.dart';
import 'package:instagram_clone/state/image_upload/exceptions/could_not_build_thumbnail.dart';
import 'package:instagram_clone/state/image_upload/extensions/get_image_aspect_ratio.dart';
import 'package:instagram_clone/state/image_upload/models/file_type.dart';
import 'package:instagram_clone/state/image_upload/models/image_with_aspect_ratio.dart';
import 'package:instagram_clone/state/image_upload/models/thumbnail_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'thumbnail.g.dart';

@riverpod
Future<ImageWithAspectRatio> thumbnail(ref, ThumbnailRequest request) async {
  final Image image;
  switch (request.fileType) {
    case FileType.image:
      image = Image.file(request.file, fit: BoxFit.fitHeight);
      break;
    case FileType.video:
      final thumbnail = await VideoThumbnail.thumbnailData(
        video: request.file.path,
        imageFormat: ImageFormat.JPEG,
        quality: 75,
      );
      if (thumbnail == null) {
        throw CouldNotBuildThumbnail();
      }
      image = Image.memory(
        thumbnail,
        fit: BoxFit.fitHeight,
      );

      break;
  }

  final aspectRatio = await image.getAspectRatio();
  return ImageWithAspectRatio(
    image: image,
    aspectRatio: aspectRatio,
  );
}
