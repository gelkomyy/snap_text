import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/choose_language_widgets/language_dialog_buttons.dart';
import 'package:snap_text/Features/home/presentation/choose_language_widgets/my_languages.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: AspectRatio(
        aspectRatio: 0.73,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),

          // height:   MediaQuery.of(context).size.height * 0.5,
          child: const Column(
            children: [
              Text(
                'Select Language',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                indent: 50,
                endIndent: 50,
              ),
              MyLanguages(),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: LanguageDialogButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
