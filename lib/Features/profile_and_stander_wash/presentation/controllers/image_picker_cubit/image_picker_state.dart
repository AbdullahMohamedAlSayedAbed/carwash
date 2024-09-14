import 'package:equatable/equatable.dart';

abstract class ImagePickerState extends Equatable {
  const ImagePickerState();
  @override
  List<Object> get props => [];
}

class ImageInitial extends ImagePickerState {}

class ImageLoading extends ImagePickerState {}

class ImagePickedSuccess extends ImagePickerState {
  final String imagePath;
  const ImagePickedSuccess(this.imagePath);

  @override
  List<Object> get props => [imagePath];
}

class ImagePickedFailure extends ImagePickerState {
  final String error;
  const ImagePickedFailure(this.error);

  @override
  List<Object> get props => [error];
}
