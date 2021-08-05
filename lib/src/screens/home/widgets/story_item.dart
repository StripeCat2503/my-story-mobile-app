import 'package:flutter/material.dart';
import 'package:my_story/src/themes/color.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: yellowPaperColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text('At 09:30 AM - Aug 03, 2021'),
              Spacer(),
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text('Test'),
                    ),
                  ];
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
