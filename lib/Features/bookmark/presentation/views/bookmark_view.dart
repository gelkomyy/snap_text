import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/bookmark/presentation/views/widgets/bookmark_view_body.dart';
import 'package:snap_text/Features/home/presentation/manager/database_manager_cubit/database_manager_cubit.dart';
import 'package:snap_text/Features/home/presentation/manager/get_bookmark_items_cubit/get_bookmark_items_cubit.dart';

import 'package:snap_text/constans.dart';
import 'package:snap_text/core/utils/get_responsive_font_size.dart';
import 'package:snap_text/core/utils/show_confirmation_dialog.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetBookmarkItemsCubit>(context).getAllModels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.bookmark),
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
                      .clearBoxModel(bookmarkBox, context);
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
          'Bookmarks',
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 20),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: kAccentColor,
      body: const SafeArea(child: BookmarkViewBody()),
    );
  }
}
