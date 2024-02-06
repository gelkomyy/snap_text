import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_language_without_insert_state.dart';

class ChangeLanguageWithoutInsertCubit
    extends Cubit<ChangeLanguageWithoutInsertState> {
  ChangeLanguageWithoutInsertCubit()
      : super(ChangeLanguageWithoutInsertInitial());
  editWithoutInsert() {
    emit(EditWithoutInsert());
  }
}
