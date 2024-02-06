import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/bookmark/presentation/views/widgets/bookmark_view_body.dart';
import 'package:snap_text/Features/home/presentation/manager/get_bookmark_items_cubit/get_bookmark_items_cubit.dart';

import 'package:snap_text/constans.dart';

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
        elevation: 0,
        backgroundColor: kAccentColor,
        title: const Text(
          'Bookmarks',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: kAccentColor,
      body: const SafeArea(child: BookmarkViewBody()),
    );
  }
}
