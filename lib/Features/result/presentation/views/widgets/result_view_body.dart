import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/home/presentation/manager/get_bookmark_items_cubit/get_bookmark_items_cubit.dart';
import 'package:snap_text/Features/home/presentation/manager/get_history_items_cubit/get_history_items_cubit.dart';
import 'package:snap_text/Features/result/presentation/views/widgets/extracted_text_field.dart';
import 'package:snap_text/Features/result/presentation/views/widgets/in_top_extracted_text_details.dart';
import 'package:snap_text/Features/result/presentation/views/widgets/result_buttons.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/widgets/loading_overlay_blured.dart';

class ResultViewBody extends StatelessWidget {
  const ResultViewBody({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBookmarkItemsCubit, GetBookmarkItemsState>(
      builder: (context, state) {
        return BlocBuilder<GetHistoryItemsCubit, GetHistoryItemsState>(
          builder: (context, state2) {
            return LoadingOverlayBlured(
              isLoading: state is GetAllBookmarkLoading ||
                  state2 is GetAllHistoryLoading,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InTopExtractedTextDetails(imageModel: imageModel),
                          const SizedBox(
                            height: 10,
                          ),
                          ExtractedTextField(
                            imageModel: imageModel,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ResultButtons(imageModel: imageModel),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
