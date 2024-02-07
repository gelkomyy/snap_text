import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:snap_text/Features/home/presentation/manager/navigation_cubit/navigation_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff151718),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.white.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            selectedIndex: selectedIndex,
            onTabChange: (value) {
              BlocProvider.of<NavigationCubit>(context)
                  .navigationIndexView(value);
            },
            rippleColor: const Color(0xff232023),
            hoverColor: const Color.fromARGB(255, 43, 38, 43),
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: const Color(0xff2C2E2F),
            color: Colors.white,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.history,
                text: 'History',
              ),
              GButton(
                icon: Icons.bookmark,
                text: 'Bookmarks',
              ),
              GButton(
                icon: Icons.info,
                text: 'Info',
              ),
            ],
            // selectedIndex: _selectedIndex,
          ),
        ),
      ),
    );
  }
}
