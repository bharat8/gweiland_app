import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gweiland_app/features/home/bloc/home_bloc.dart';
import 'package:gweiland_app/utils/application/core/enums.dart';
import 'package:gweiland_app/utils/buttons/primary_icon_button.dart';
import 'package:gweiland_app/utils/images_constant.dart';
import 'package:gweiland_app/utils/ui_constants.dart';
import 'package:gweiland_app/utils/ui_helpers.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.fromLTRB(
        UIConstants.baseMargin * 2,
        0,
        UIConstants.baseMargin * 2,
        (UIConstants.baseMargin * 2) + MediaQuery.of(context).padding.bottom,
      ),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: UIConstants.largeBorderRadius,
      ),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Row(
            children: [
              bottomNavItem(
                icon: PhosphorIcons.smiley(PhosphorIconsStyle.light),
                isActive: state.tab == AppTabs.shop,
                label: r'€-$hop',
                onTap: () => context.read<HomeBloc>().add(
                      const SelectTab(
                        tab: AppTabs.shop,
                      ),
                    ),
              ),
              bottomNavItem(
                icon: PhosphorIcons.arrowsLeftRight(PhosphorIconsStyle.light),
                isActive: state.tab == AppTabs.exchange,
                label: 'Exchange',
                onTap: () => context.read<HomeBloc>().add(
                      const SelectTab(
                        tab: AppTabs.exchange,
                      ),
                    ),
              ),
              bottomNavItem(
                image: ImagesConstant.globeIcon,
                isActive: state.tab == AppTabs.globe,
                showColored: false,
                onTap: () => context.read<HomeBloc>().add(
                      const SelectTab(
                        tab: AppTabs.globe,
                      ),
                    ),
              ),
              bottomNavItem(
                icon: PhosphorIcons.rocketLaunch(PhosphorIconsStyle.light),
                isActive: state.tab == AppTabs.launchpad,
                label: 'Launchpads',
                onTap: () => context.read<HomeBloc>().add(
                      const SelectTab(
                        tab: AppTabs.launchpad,
                      ),
                    ),
              ),
              bottomNavItem(
                icon: PhosphorIcons.wallet(PhosphorIconsStyle.light),
                isActive: state.tab == AppTabs.wallet,
                label: 'Wallet',
                onTap: () => context.read<HomeBloc>().add(
                      const SelectTab(
                        tab: AppTabs.wallet,
                      ),
                    ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget bottomNavItem({
    String? image,
    IconData? icon,
    required bool isActive,
    String label = '',
    bool showColored = true,
    void Function()? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryIconButton(
              image: image,
              icon: icon,
              imageColor: showColored
                  ? isActive
                      ? Colors.white
                      : Colors.grey
                  : Colors.transparent,
              fit: BoxFit.contain,
              colorBlend: BlendMode.srcATop,
              iconColor: isActive ? Colors.white : Colors.grey,
            ),
            if (label.isNotEmpty) ...[
              verticalSpaceSmall,
              Center(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: isActive ? Colors.white : Colors.grey,
                        fontSize: 10,
                      ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
