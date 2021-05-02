import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Setup/journaling_data_service.dart';
import './gratitude_entries_screen.dart';

class GratitudeMainScreen extends StatefulWidget {
  @override
  _GratitudeMainScreenState createState() => _GratitudeMainScreenState();
}

class _GratitudeMainScreenState extends State<GratitudeMainScreen> {
  List<String> _questions = [
    "Where did you find beauty today?",
    "Is there a person in your life that inspired you recently?",
    "What did you do recently that you can be proud of?",
    "What's something you're looking forward to in the future?",
    "Who made a positive impact in your life recently?",
  ];
  String question = "What can you be grateful for today?";

  String getRandomQuestion(List<String> questions) {
    if (this._questions.length < 1) {
      this._questions = [
        "Where did you find beauty today?",
        "Is there a person in your life that inspired you recently?",
        "What did you do recently that you can be proud of?",
        "What's something you're looking forward to in the future?",
        "Who made a positive impact in your life recently?",
        "What can you be grateful for today?"
      ];
      return getRandomQuestion(this._questions);
    }
    final _randomizer = Random();
    int index = _randomizer.nextInt(questions.length);
    String question = questions[index];
    questions.removeAt(index);
    return question;
  }

  void changeQuestion() {
    setState(() {
      question = getRandomQuestion(_questions);
    });
  }

  final TextEditingController answer1Controller = TextEditingController();
  final TextEditingController answer2Controller = TextEditingController();
  final TextEditingController answer3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Components
    var _header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.grey,
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        Text(
          "Easify",
          style: TextStyle(
            fontFamily: "Corbel",
            fontSize: size.height * 0.03,
          ),
        ),
        IconButton(
          icon: Icon(
            CupertinoIcons.list_bullet,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GratitudeEntriesScreen()),
            );
          },
        ),
      ],
    );

    final _textFields = Column(
      children: [
        TextFormField(
          controller: answer1Controller,
          decoration: InputDecoration(
            labelText: "Reason no. 1",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        TextFormField(
          controller: answer2Controller,
          decoration: InputDecoration(
            labelText: "Reason no. 2",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        TextFormField(
          controller: answer3Controller,
          decoration: InputDecoration(
            labelText: "Reason no. 3",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              child: _header,
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Container(
              child: Text('$question'),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextButton.icon(
                onPressed: changeQuestion,
                icon: Icon(Icons.swap_horizontal_circle_outlined),
                label: Text(
                  "Change prompt",
                )),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(
                left: size.width * 0.1,
                right: size.width * 0.1,
              ),
              child: _textFields,
            ),
            Container(
              child: ElevatedButton.icon(
                icon: Icon(Icons.done_outline_rounded),
                label: Text("Done"),
                onPressed: () {
                  uploadGratitudeJournalEntry(answer1Controller.text,
                      answer2Controller.text, answer3Controller.text);
                  while (Navigator.canPop(context)) Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GratitudeEntriesScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
