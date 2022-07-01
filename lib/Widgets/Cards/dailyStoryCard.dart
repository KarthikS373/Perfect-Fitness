import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_view/story_view.dart';

class DailyStory extends StatefulWidget {
  const DailyStory({
    Key? key,
  }) : super(key: key);

  @override
  State<DailyStory> createState() => _DailyStoryState();
}

class _DailyStoryState extends State<DailyStory> {
  final _controller = StoryController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final List<StoryItem> storyItems = [
      StoryItem.text(
        title: "Caption here",
        textStyle: GoogleFonts.aBeeZee(),
        backgroundColor: secondaryColor,
      ),
      StoryItem.pageImage(
        controller: _controller,
        caption: "Caption 1",
        imageFit: BoxFit.fill,
        url:
            'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1220&q=80',
      ),
      StoryItem.pageImage(
        controller: _controller,
        caption: "Caption 2",
        imageFit: BoxFit.fill,
        url:
            'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {},
        splashColor: secondaryColor,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: secondaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          height: media.size.height * 0.3,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              20,
            ),
            child: StoryView(
              progressPosition: ProgressPosition.bottom,
              controller: _controller,
              repeat: true,
              onStoryShow: (s) {},
              onComplete: () {},
              onVerticalSwipeComplete: (direction) {
                if (direction == Direction.down) {
                  Navigator.pop(context);
                }
              },
              storyItems: storyItems,
            ),
          ),
        ),
      ),
    );
  }
}
