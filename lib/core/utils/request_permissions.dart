import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermissions(List<Permission> permissionList) async {
  Map<Permission, PermissionStatus> statuses = await permissionList.request();

  if (statuses[Permission.camera] == PermissionStatus.granted &&
      statuses[Permission.storage] == PermissionStatus.granted) {
    // Permission granted, you can now use camera and gallery
    // Proceed with your logic here
    return true;
  } else {
    // Permission denied
    // You might want to display an error message or handle this case accordingly
    return false;
  }
}
