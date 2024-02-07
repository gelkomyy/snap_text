import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/home/presentation/manager/navigation_cubit/navigation_cubit.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/navigation_page.dart';

class ManageBackButton extends StatelessWidget {
  const ManageBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return PopScope(
            canPop: state == 0,
            onPopInvoked: (dopop) {
              final currentTabIndex = context.read<NavigationCubit>().state;
              if (currentTabIndex != 0) {
                context
                    .read<NavigationCubit>()
                    .navigationIndexView(currentTabIndex - 1);
              }
            },
            child: const NavigationPage(),
          );
        },
      ),
    );
  }
}
