import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/database_helper.dart';

part 'database_manager_state.dart';

class DatabaseManagerCubit extends Cubit<DatabaseManagerState> {
  DatabaseManagerCubit() : super(DatabaseManagerInitial());
  DatabaseHelper databaseHelper = DatabaseHelper();
  DatabaseHelper databaseHelper2 = DatabaseHelper();

  Future<void> insertModel(
      {required ImageModel imageModel, required String boxName}) async {
    emit(InsertModelLoading());
    await databaseHelper.insertModelHive(
        imageModel: imageModel, boxName: boxName);
    emit(InsertModelDone());
  }

  List<ImageModel> getAllModels(String boxName) {
    emit(GetAllModelsLoading());
    List<ImageModel> models = databaseHelper.getAllModelsHive(boxName);
    emit(GetAllModelsDone());
    return models;
  }

  Future<void> deleteModel(
      {required ImageModel imageModel, required String boxName}) async {
    emit(DeleteModelLoading());
    await databaseHelper.deleteModelHive(
        boxName: boxName, imageModel: imageModel);
    emit(DeleteModelDone());
  }

  Future<void> saveAfterEditedModel(
      {required ImageModel imageModel, required String boxName}) async {
    emit(SaveModelLoading());
    await databaseHelper.saveAfterEditedModelHive(
        boxName: boxName, imageModel: imageModel);
    emit(SaveModelDone());
  }

  Future<void> clearBoxModel(String boxName) async {
    emit(ClearModelLoading());
    await databaseHelper.clearBoxModelHive(boxName);
    emit(ClearModelDone());
  }

  editWithoutInsert() {
    emit(EditWithoutInsert());
  }

  @override
  Future<void> close() async {
    await databaseHelper.closeBoxModelHive(historyBox);
    await databaseHelper2.closeBoxModelHive(historyBox);
    await databaseHelper.closeBoxModelHive(bookmarkBox);
    await databaseHelper2.closeBoxModelHive(bookmarkBox);
    return super.close();
  }
}
