import 'story.dart';

class StoryBrain {
  final List<Story> _storyList = [
    Story(
        storyTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.',
        ref1: 2,
        ref2: 1),
    Story(
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.',
        ref1: 2,
        ref2: 3),
    Story(
        storyTitle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.',
        ref1: 5,
        ref2: 4),
    Story(
        storyTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: '',
        ref1: 0,
        ref2: 0),
    Story(
        storyTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: '',
        ref1: 0,
        ref2: 0),
    Story(
        storyTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '',
        ref1: 0,
        ref2: 0)
  ];
  int _storyNumber = 0;

  String getStoryText() {
    return _storyList[_storyNumber].storyTitle;
  }

  String getStoryChoice1() {
    return _storyList[_storyNumber].choice1;
  }

  String getStoryChoice2() {
    return _storyList[_storyNumber].choice2;
  }

  bool getVisibilty() {
    if (_storyList[_storyNumber].ref2 == 0) {
      return false;
    }
    return true;
  }

  void nextStoryLine(bool choice) {
    if (choice == true) {
      _storyNumber = _storyList[_storyNumber].ref1;
    } else {
      _storyNumber = _storyList[_storyNumber].ref2;
    }
  }
}
