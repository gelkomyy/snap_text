import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/database_helper.dart';

part 'get_bookmark_items_state.dart';

class GetBookmarkItemsCubit extends Cubit<GetBookmarkItemsState> {
  GetBookmarkItemsCubit() : super(GetBookmarkItemsInitial());
  DatabaseHelper databaseHelper = DatabaseHelper();
  Future<List<ImageModel>> getAllModels() async {
    emit(GetAllBookmarkLoading());
    List<ImageModel> models = databaseHelper.getAllModelsHive(bookmarkBox);
    await Future.delayed(const Duration(seconds: 2));
    emit(GetAllBookmarkDone(models: models));
    return models;
  }
}
