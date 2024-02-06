import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:snap_text/Features/home/presentation/manager/database_manager_cubit/database_manager_cubit.dart';
import 'package:snap_text/Features/home/presentation/views/home_view.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

void main() async {
  Hive.registerAdapter(LanguagesEnumAdapter());
  Hive.registerAdapter(ImageModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<ImageModel>(historyBox);
  await Hive.openBox<ImageModel>(bookmarkBox);

  runApp(const SnapText());
}

class SnapText extends StatelessWidget {
  const SnapText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DatabaseManagerCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
