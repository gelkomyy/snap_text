//import 'dart:io';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/selection_source_item.dart';
import 'package:snap_text/core/utils/custom_snack_bar.dart';
import 'package:snap_text/core/utils/picked_image.dart';
import 'package:snap_text/core/utils/request_permissions.dart';

class SelectionSource extends StatelessWidget {
  const SelectionSource({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: InkWell(
            onTap: () async {
              bool permissionAllow = await requestPermissionsCamera();
              if (!context.mounted) return;
              if (permissionAllow) {
                await pickImage(context, ImageSource.camera);
              } else {
                showCutomSnackBar(context, 'The app need camera permission');
                await Future.delayed(const Duration(seconds: 1));
                if (await Permission.camera.isPermanentlyDenied) {
                  // user manually enables it in the system settings.
                  openAppSettings();
                }
              }
            },
            child: const SelectionSourceItem(
              text: 'Camera',
              iconData: Icons.photo_camera,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: InkWell(
            onTap: () async {
              bool permissionAllow = await requestPermissionsStoragePhotos();

              if (!context.mounted) return;
              if (permissionAllow) {
                await pickImage(context, ImageSource.gallery);
              } else {
                showCutomSnackBar(context, 'The app need storage permission');
                await Future.delayed(const Duration(seconds: 1));
                if (Platform.isAndroid) {
                  final androidInfo = await DeviceInfoPlugin().androidInfo;
                  if (androidInfo.version.sdkInt <= 32) {
                    if (await Permission.storage.isPermanentlyDenied) {
                      // user manually enables it in the system settings.
                      openAppSettings();
                    }
                  } else {
                    if (await Permission.photos.isPermanentlyDenied) {
                      // user manually enables it in the system settings.
                      openAppSettings();
                    }
                  }
                }
              }
            },
            child: const SelectionSourceItem(
              text: 'Gallery',
              iconData: Icons.photo_library,
            ),
          ),
        ),
      ],
    );
  }
}
