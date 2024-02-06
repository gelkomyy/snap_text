import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/home/presentation/manager/get_bookmark_items_cubit/get_bookmark_items_cubit.dart';
import 'package:snap_text/Features/home/presentation/manager/get_history_items_cubit/get_history_items_cubit.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/database_helper.dart';

part 'database_manager_state.dart';

class DatabaseManagerCubit extends Cubit<DatabaseManagerState> {
  DatabaseManagerCubit() : super(DatabaseManagerInitial());
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> insertModel(
      {required ImageModel imageModel,
      required String boxName,
      required BuildContext context}) async {
    emit(InsertModelLoading());
    await databaseHelper.insertModelHive(
        imageModel: imageModel, boxName: boxName);
    emit(InsertModelDone());
    if (!context.mounted) return;
    if (boxName == historyBox) {
      await BlocProvider.of<GetHistoryItemsCubit>(context).getAllModels();
    } else if (boxName == bookmarkBox) {
      await BlocProvider.of<GetBookmarkItemsCubit>(context).getAllModels();
    }
  }

  Future<void> deleteModel(
      {required ImageModel imageModel,
      required String boxName,
      required BuildContext context}) async {
    emit(DeleteModelLoading());
    await databaseHelper.deleteModelHive(
        boxName: boxName, imageModel: imageModel);
    emit(DeleteModelDone());
    if (!context.mounted) return;
    if (boxName == historyBox) {
      await BlocProvider.of<GetHistoryItemsCubit>(context).getAllModels();
    } else if (boxName == bookmarkBox) {
      await BlocProvider.of<GetBookmarkItemsCubit>(context).getAllModels();
    }
  }

  Future<void> saveAfterEditedModel(
      {required ImageModel imageModel, required String boxName}) async {
    emit(SaveModelLoading());
    await databaseHelper.saveAfterEditedModelHive(
        boxName: boxName, imageModel: imageModel);
    emit(SaveModelDone());
  }

  Future<void> clearBoxModel(String boxName, BuildContext context) async {
    emit(ClearModelLoading());
    await databaseHelper.clearBoxModelHive(boxName);
    emit(ClearModelDone());
    if (!context.mounted) return;
    if (boxName == historyBox) {
      await BlocProvider.of<GetHistoryItemsCubit>(context).getAllModels();
    } else if (boxName == bookmarkBox) {
      await BlocProvider.of<GetBookmarkItemsCubit>(context).getAllModels();
    }
  }

  @override
  Future<void> close() async {
    await databaseHelper.closeBoxModelHive(historyBox);
    await databaseHelper.closeBoxModelHive(bookmarkBox);
    return super.close();
  }
}
