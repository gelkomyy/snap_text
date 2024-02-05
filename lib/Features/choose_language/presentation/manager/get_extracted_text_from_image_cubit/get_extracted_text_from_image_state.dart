part of 'get_extracted_text_from_image_cubit.dart';

@immutable
sealed class GetExtractedTextFromImageState {}

final class GetExtractedTextFromImageLoading
    extends GetExtractedTextFromImageState {}

final class GetExtractedTextFromImageDone
    extends GetExtractedTextFromImageState {}
