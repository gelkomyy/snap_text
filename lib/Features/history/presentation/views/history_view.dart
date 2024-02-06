import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/history/presentation/views/widgets/history_view_body.dart';
import 'package:snap_text/Features/home/presentation/manager/get_history_items_cubit/get_history_items_cubit.dart';

import 'package:snap_text/constans.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HistoryView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetHistoryItemsCubit>(context).getAllModels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kAccentColor,
        title: const Text(
          'History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: kAccentColor,
      body: const SafeArea(child: HistoryViewBody()),
    );
  }
}
