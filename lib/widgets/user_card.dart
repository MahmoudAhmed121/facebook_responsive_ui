import 'package:facebook_responsive_ui/model/export.dart';
import 'package:facebook_responsive_ui/widgets/export.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.currentUser,
  });

  final User currentUser;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileAvatar(
          imageUrl: currentUser.imageUrl,
        ),
        const SizedBox(
          width: 6,
        ),
        FittedBox(
          child: Text(
            currentUser.name,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
