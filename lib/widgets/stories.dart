import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_responsive_ui/config/plate.dart';
import 'package:facebook_responsive_ui/model/export.dart';
import 'package:facebook_responsive_ui/widgets/export.dart';
import 'package:facebook_responsive_ui/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({super.key, required this.currentUser, required this.stories});
  final User currentUser;
  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 8,
        ),
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: _StoryCard(
                currentUser: currentUser,
                isAddStory: true,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _StoryCard(
              story: story,
            ),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    this.story,
    this.currentUser,
    this.isAddStory = false,
  });

  final Story? story;
  final bool isAddStory;
  final User? currentUser;

  @override
  Widget build(BuildContext context) {
    return isAddStory
        ? Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: currentUser!.imageUrl,
                  height: double.infinity,
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 60,
                    width: 110,
                    color: Colors.grey[200],
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Add to Story',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                right: 40,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    iconSize: 30,
                    color: Palette.facebookBlue,
                    icon: const Icon(Icons.add),
                  ),
                ),
              ),
            ],
          )
        : Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: story!.imageUrl,
                  height: double.infinity,
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: double.infinity,
                width: 110,
                decoration: BoxDecoration(
                  gradient: Palette.storyGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: ProfileAvatar(
                  imageUrl: story!.user.imageUrl,
                  hasBorder: !story!.isViewed,
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                left: 8,
                child: Text(
                  story!.user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
  }
}
