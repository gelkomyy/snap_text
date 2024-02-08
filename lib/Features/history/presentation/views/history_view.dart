import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/history/presentation/views/widgets/history_view_body.dart';
import 'package:snap_text/Features/home/presentation/manager/database_manager_cubit/database_manager_cubit.dart';
import 'package:snap_text/Features/home/presentation/manager/get_history_items_cubit/get_history_items_cubit.dart';

import 'package:snap_text/constans.dart';
import 'package:snap_text/core/utils/get_responsive_font_size.dart';
import 'package:snap_text/core/utils/show_confirmation_dialog.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetHistoryItemsCubit>(context).getAllModels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.history),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () async {
                bool delete = await showConfirmationDialog(
                    context: context,
                    text: 'Are sure you want to delete all the files?');
                if (delete) {
                  if (!context.mounted) return;
                  await BlocProvider.of<DatabaseManagerCubit>(context)
                      .clearBoxModel(historyBox, context);
                }
              },
              icon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: kAccentColor,
        title: Text(
          'History',
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 20),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: kAccentColor,
      body: const SafeArea(child: HistoryViewBody()),
    );
  }
}
