import 'package:facebook_responsive_ui/config/plate.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    this.isBottomIndicator = false,
  });
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: isBottomIndicator
            ? const Border(
                bottom: BorderSide(color: Palette.facebookBlue, width: 3),
              )
            : const Border(
                top: BorderSide(color: Palette.facebookBlue, width: 3),
              ),
      ),
      tabs: icons
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              Icon(
                e,
                color:
                    i == selectedIndex ? Palette.facebookBlue : Colors.black45,
              ),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
