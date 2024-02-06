part of 'change_language_without_insert_cubit.dart';

@immutable
sealed class ChangeLanguageWithoutInsertState {}

final class ChangeLanguageWithoutInsertInitial
    extends ChangeLanguageWithoutInsertState {}

final class EditWithoutInsert extends ChangeLanguageWithoutInsertState {}
