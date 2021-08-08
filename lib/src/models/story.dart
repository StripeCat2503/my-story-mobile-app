import 'dart:io';

import 'package:my_story/src/models/block.dart';

class Story {
  int id;
  String? title;
  List<Block>? blocks;
  DateTime? createdDate;

  Story({
    this.id = 0,
    this.title,
    this.blocks,
    this.createdDate,
  });

  factory Story.init() {
    return Story(
      title: '',
      blocks: [],
      createdDate: DateTime.now(),
    );
  }
}
