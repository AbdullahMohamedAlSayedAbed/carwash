import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/controllers/image_picker_cubit/image_picker_cubit.dart';
import 'package:carwash/Features/profile_and_stander_wash/presentation/controllers/image_picker_cubit/image_picker_state.dart';
import 'package:carwash/core/Utils/app_color.dart';
import 'package:carwash/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomImageProfile extends StatelessWidget {
  const CustomImageProfile({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePickerCubit, ImagePickerState>(
      builder: (context, state) {
        if (state is ImagePickedSuccess) {
          return customImageProfileSuccess(
              image: image, imagePath: state.imagePath);
        }
        if (state is ImageInitial) {
          return customImageProfileSuccess(image: image);
        }
        if (state is ImagePickedFailure) {
          return customImageProfileSuccess(image: image);
        }
        return const CustomFadingWidget(
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 40,
          ),
        );
      },
    );
  }
}

class customImageProfileSuccess extends StatelessWidget {
  const customImageProfileSuccess({
    super.key,
    required this.image,
    this.imagePath,
  });

  final String image;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage:
                imagePath != null ? FileImage(File(imagePath!)) : null,
            child: imagePath == null
                ? CachedNetworkImage(
                    imageUrl: image,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => CustomFadingWidget(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[400],
                        radius: 40,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : const SizedBox(),
          ),
          InkWell(
            onTap: () {
              _showImageSourceActionSheet(context);
            },
            child: const CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 15,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a picture'),
                onTap: () {
                  BlocProvider.of<ImagePickerCubit>(context).pickImage(fromCamera: true);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () {
                  BlocProvider.of<ImagePickerCubit>(context).pickImage(fromCamera: false);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

