import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermissionsStoragePhotos() async {
  List<Permission> permissionList = [Permission.storage];
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt <= 32) {
      permissionList = [Permission.storage];
    } else {
      permissionList = [Permission.photos];
    }
  }
  Map<Permission, PermissionStatus> statuses = await permissionList.request();

  if (statuses[permissionList[0]] == PermissionStatus.granted) {
    // Permission granted, you can now use camera and gallery
    // Proceed with your logic here
    return true;
  } else {
    // Permission denied
    // You might want to display an error message or handle this case accordingly
    return false;
  }
}

Future<bool> requestPermissionsCamera() async {
  List<Permission> permissionList = [Permission.camera];

  Map<Permission, PermissionStatus> statuses = await permissionList.request();

  if (statuses[permissionList[0]] == PermissionStatus.granted) {
    // Permission granted, you can now use camera and gallery
    // Proceed with your logic here
    return true;
  } else {
    // Permission denied
    // You might want to display an error message or handle this case accordingly
    return false;
  }
}
