import 'package:hive/hive.dart';
import 'package:snap_text/core/models/image_model.dart';

class DatabaseHelper {
  Future<void> insertModelHive(
      {required ImageModel imageModel, required String boxName}) async {
    var box = await Hive.openBox(boxName);
    await box.add(imageModel);
    await box.close();
  }

  Future<List<ImageModel>> getAllModelsHive(String boxName) async {
    var box = await Hive.openBox(boxName);
    List<ImageModel> models = box.values.cast<ImageModel>().toList();
    await box.close();
    return models;
  }

  Future<void> deleteModelHive(
      {required ImageModel imageModel, required String boxName}) async {
    var box = await Hive.openBox(boxName);
    await imageModel.delete();
    await box.close();
  }

  Future<void> saveAfterEditedModelHive(
      {required ImageModel imageModel, required String boxName}) async {
    var box = await Hive.openBox(boxName);
    await imageModel.save();
    await box.close();
  }

  Future<void> clearBoxModelHive(String boxName) async {
    var box = await Hive.openBox(boxName);
    await box.clear();
    await box.close();
  }
}
