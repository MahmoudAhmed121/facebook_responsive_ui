import 'package:facebook_responsive_ui/config/plate.dart';
import 'package:facebook_responsive_ui/model/export.dart';
import 'package:facebook_responsive_ui/widgets/export.dart';
import 'package:facebook_responsive_ui/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  const Rooms({super.key, required this.onlineUsers});
  final List<User> onlineUsers;
  @override
  Widget build(BuildContext context) {
      final isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 3 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 4),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 8,
                ),
                child: _CrateRoomButton(),
              );
            }
            final user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CrateRoomButton extends StatelessWidget {
  const _CrateRoomButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: const ButtonStyle(
        textStyle: MaterialStatePropertyAll<TextStyle>(
          TextStyle(color: Palette.facebookBlue),
        ),
      ),
      onPressed: () {},
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (bounds) =>
                Palette.createRoomGradient.createShader(bounds),
            child: const Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text('Create\n Room')
        ],
      ),
    );
  }
}
