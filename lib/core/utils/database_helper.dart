import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:snap_text/core/models/image_model.dart';

class DatabaseHelper {
  Future<void> insertModelHive(
      {required ImageModel imageModel, required String boxName}) async {
    var box = Hive.box<ImageModel>(boxName);
    await box.add(imageModel);
  }

  List<ImageModel> getAllModelsHive(String boxName) {
    var box = Hive.box<ImageModel>(boxName);
    List<ImageModel> models = box.values.cast<ImageModel>().toList();
    return models;
  }

  Future<void> deleteModelHive(
      {required ImageModel imageModel, required String boxName}) async {
    await imageModel.delete();
  }

  Future<void> saveAfterEditedModelHive(
      {required ImageModel imageModel, required String boxName}) async {
    await imageModel.save();
  }

  Future<void> clearBoxModelHive(String boxName) async {
    var box = Hive.box<ImageModel>(boxName);
    await box.clear();
  }

  Future<void> closeBoxModelHive(String boxName) async {
    var box = Hive.box<ImageModel>(boxName);
    await box.close();
  }
}
/* Future<void> deleteHiveDatabase() async {
  // Get the directory where Hive stores its data
  final appDocumentDir = await getApplicationDocumentsDirectory();
  final hiveDir = Directory(appDocumentDir.path);

  // Check if the Hive directory exists
  if (hiveDir.existsSync()) {
    // Delete the directory and all its contents
    await hiveDir.delete(recursive: true);
    print('Hive database deleted successfully.');
  } else {
    print('Hive database directory not found.');
  }
} */