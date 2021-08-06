import 'package:flutter/material.dart';
import 'package:my_story/src/models/story.dart';
import 'package:my_story/src/screens/home/widgets/story_item.dart';

class StoryList extends StatelessWidget {
  StoryList({
    Key? key,
    this.stories,
  }) : super(key: key);

  final List<Story>? stories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: stories!.map((story) => StoryItem(story: story)).toList(),
    );
  }
}
