import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/database_helper.dart';

part 'get_history_items_state.dart';

class GetHistoryItemsCubit extends Cubit<GetHistoryItemsState> {
  GetHistoryItemsCubit() : super(GetHistoryItemsInitial());
  DatabaseHelper databaseHelper = DatabaseHelper();
  Future<List<ImageModel>> getAllModels() async {
    emit(GetAllHistoryLoading());
    List<ImageModel> models = databaseHelper.getAllModelsHive(historyBox);
    await Future.delayed(const Duration(seconds: 2));
    if (models.isNotEmpty) {
      emit(GetAllHistoryDone(models: models));
    } else {
      emit(GetHistoryItemsInitial());
    }
    return models;
  }
}
