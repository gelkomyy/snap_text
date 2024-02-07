import 'package:flutter/material.dart';

Future<bool> showConfirmationDialog(
    {required BuildContext context, required String text}) async {
  return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // User pressed "No"
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // User pressed "Yes"
                },
                child: const Text('Delete'),
              ),
            ],
          );
        },
      ) ??
      false; // Default to false if showDialog returns null
}
