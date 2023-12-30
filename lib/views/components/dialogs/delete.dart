import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone/views/components/constants/strings.dart';
import 'package:instagram_clone/views/components/dialogs/alert.dart';

@immutable
class DeleteDialog extends AlertDialogModel<bool> {
  const DeleteDialog({required String titleOfObjectToDelete})
      : super(
            title: '${Strings.delete} $titleOfObjectToDelete ?',
            message:
                '${Strings.areYouSureThatYouWantToDeleteThis} $titleOfObjectToDelete ?',
            buttons: const {Strings.cancel: false, Strings.delete: true});
}
