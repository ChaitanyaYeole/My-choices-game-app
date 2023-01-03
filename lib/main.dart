import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(const MyChoice());
}

StoryBrain storyBrain = StoryBrain();

class MyChoice extends StatelessWidget {
  const MyChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const MakeChoices(),
        ],
      )),
    );
  }
}

class MakeChoices extends StatefulWidget {
  const MakeChoices({super.key});

  @override
  State<MakeChoices> createState() => _MakeChoicesState();
}

class _MakeChoicesState extends State<MakeChoices> {
  void nextStory(bool choice) {
    setState(() {
      storyBrain.nextStoryLine(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Text(
                storyBrain.getStoryText(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => nextStory(true),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              child: Text(
                storyBrain.getStoryChoice1(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Visibility(
            visible: storyBrain.getVisibilty(),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => nextStory(false),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
                child: Text(
                  storyBrain.getStoryChoice2(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
