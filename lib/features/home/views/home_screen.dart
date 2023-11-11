import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gweiland_app/features/exchange/views/exchange_screen.dart';
import 'package:gweiland_app/features/home/bloc/home_bloc.dart';
import 'package:gweiland_app/features/home/views/widgets/bottom_nav_bar.dart';
import 'package:gweiland_app/utils/application/core/enums.dart';
import 'package:gweiland_app/utils/buttons/buttons.dart';
import 'package:gweiland_app/utils/presentation/app_bar/custom_app_bar.dart';
import 'package:gweiland_app/utils/ui_constants.dart';
import 'package:gweiland_app/utils/ui_helpers.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        showLeadingIcon: false,
        appTitleWidget: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Text(
              state.tab.name.toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            );
          },
        ),
        actions: [
          PrimaryIconButton(
            padding: const EdgeInsets.symmetric(
              horizontal: UIConstants.baseMargin,
            ),
            icon: PhosphorIcons.bell(),
          ),
          PrimaryIconButton(
            padding: const EdgeInsets.symmetric(
              horizontal: UIConstants.baseMargin,
            ),
            icon: PhosphorIcons.gearSix(),
          ),
          horizontalSpaceRegular,
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: currentTab(),
    );
  }

  Widget currentTab() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.tab) {
          case AppTabs.exchange:
            return const ExchangeScreen();
          case AppTabs.globe:
            return const SizedBox.shrink();
          case AppTabs.launchpad:
            return const SizedBox.shrink();
          case AppTabs.shop:
            return const SizedBox.shrink();
          case AppTabs.wallet:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
