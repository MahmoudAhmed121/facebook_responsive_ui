import 'package:facebook_responsive_ui/config/plate.dart';
import 'package:facebook_responsive_ui/model/export.dart';
import 'package:facebook_responsive_ui/widgets/export.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    required this.currentUser,
  });

  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 2),
            color: Colors.black12,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(
            child: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: 600,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Row(
            children: [
              UserCard(
                currentUser: currentUser,
              ),
              const SizedBox(
                width: 12,
              ),
              CircleButton(
                icon: Icons.search,
                onPressed: () {},
                iconSize: 30,
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                onPressed: () {},
                iconSize: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
