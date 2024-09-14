import 'package:carwash/Features/profile_and_stander_wash/presentation/controllers/image_picker_cubit/image_picker_state.dart';
import 'package:carwash/core/services/shard_pref.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';



class ImagePickerCubit extends Cubit<ImagePickerState> {
  final ImagePicker _imagePicker;

  ImagePickerCubit(
    this._imagePicker,
  ) : super(ImageInitial()) {
    _loadImagePath();
  }

  // Load the image path when the app starts
  void _loadImagePath()  {
    final imagePath = ShardPref.getDataString(key: 'imagePath');
    if (imagePath != null) {
      emit(ImagePickedSuccess(imagePath));
    }
  }

  Future<void> pickImage({required bool fromCamera}) async {
    emit(ImageLoading());
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      );

      if (pickedFile != null) {
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = pickedFile.name;
        final localImage =
            await File(pickedFile.path).copy('${appDir.path}/$fileName');

        // Save the image path in SharedPreferences
        await ShardPref.saveData(key: 'imagePath', value: localImage.path);

        emit(ImagePickedSuccess(localImage.path));
      } else {
        emit(const ImagePickedFailure('No image selected.'));
      }
    } catch (e) {
      emit(ImagePickedFailure(e.toString()));
    }
  }
}
