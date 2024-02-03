import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/choose_language_widgets/choose_language_box.dart';
import 'package:snap_text/Features/home/presentation/choose_language_widgets/language_dialog.dart';

class BottomOfLanguageView extends StatelessWidget {
  const BottomOfLanguageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return const LanguageDialog();
              });
        },
        child: const ChooseLanguageBox(),
      ),
      const SizedBox(
        height: 16,
      ),
      Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
        width: double.infinity,
        height: 46,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff3F54FF),
          ),
          child: const Text(
            'Extract Text',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ]);
  }
}
