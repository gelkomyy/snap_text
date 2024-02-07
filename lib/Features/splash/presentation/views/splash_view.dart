import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:snap_text/Features/home/presentation/views/home_view.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/database_helper.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
          ..addListener(() {
            setState(() {});
          });
    _animationController.forward();

    cInitHive().then((value) {
      setState(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      });
    });
  }

  Future<void> cInitHive() async {
    Hive.registerAdapter(LanguagesEnumAdapter());
    Hive.registerAdapter(ImageModelAdapter());
    await Hive.initFlutter();
    await Hive.openBox<ImageModel>(historyBox);

    await Hive.openBox<ImageModel>(bookmarkBox);
    await DatabaseHelper().deleteExpiredModels(historyBox, 7);
    await Future.delayed(const Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlueAccent,
              kPrimaryColor
            ], // Set your gradient colors
            begin: Alignment.topLeft, // Optional, defaults to top center
            end: Alignment.bottomRight, // Optional, defaults to bottom center
            //   stops: [ 0.4, 0.3], // Optional, specify the stop points
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Replace 'assets/logo.png' with the path to your PNG logo
              Image.asset(
                'assets/logo.png',
                width: 250 * _animation.value,
                height: 250 * _animation.value,
              ),

              const SizedBox(height: 20),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
