import 'package:easify/screens/journal/components/emotion_anchor.dart';
import 'package:easify/screens/journal/previous_entries_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Setup/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class JournalingScreen extends StatefulWidget {
  int emotionId;

  JournalingScreen({this.emotionId});

  @override
  _JournalingScreenState createState() => _JournalingScreenState();
}

class _JournalingScreenState extends State<JournalingScreen> {
  TextEditingController textEditingController = TextEditingController();
  var _anchorTexts = [
    "Money",
    "Health",
    "School",
    "Work",
    "Family",
    "Relationships",
    "Sleep",
    "Friends",
    "Spirituality",
  ];
  List<EmotionAnchor> _anchors = [];
  List<EmotionAnchor> fetchAnchors() {
    List<EmotionAnchor> list = [];
    for (int i = 0; i < _anchorTexts.length; i++) {
      var instance = EmotionAnchor(anchorText: _anchorTexts[i]);
      list.add(instance);
    }
    return list;
  }

  List<String> getActiveAnchorsNames() {
    List<String> result = [];
    for (var anchor in _anchors) {
      if (anchor.active) {
        result.add(anchor.anchorText);
      }
    }
    return result;
  }

  @override
  void initState() {
    _anchors = fetchAnchors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    DatabaseService databaseService = DatabaseService(uid: user.uid);
    final _emotionPicNames = [
      "happyOK.png",
      "excitedOK.png",
      "gratefulOK.png",
      "relaxedOK.png",
      "contentOK.PNG",
      "tiredOK.png",
      "boredOK.png",
      "confusedOK.png",
      "anxiousOK.png",
      "angryOK.PNG",
      "stressedOK.PNG",
      "sadOK.PNG"
    ];
    var size = MediaQuery.of(context).size;

    final keyboardOn = MediaQuery.of(context).viewInsets.bottom != 0;

    Widget anchorsWidget = Column(
      children: [
        Container(
          child: Row(
            children: _anchors.sublist(0, 5),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          margin: EdgeInsets.only(
            top: size.height * 0.01,
            bottom: size.height * 0.01,
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.95,
          child: Container(
            child: Row(
              children: _anchors.sublist(5, _anchors.length),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        )
      ],
    );

    Widget handleEmotionAndText() {
      if (!keyboardOn) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: size.height * 0.08,
                child: Image.asset("assets/images/emojis/" +
                    _emotionPicNames[widget.emotionId])),
            Container(
              width: size.width * 0.5,
              child: Text(
                "Take a moment to notice what makes you feel this way.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      } else {
        return SizedBox(
          height: 0,
          width: 0,
        );
      }
    }

    EdgeInsets handleEmotionAndTextMargins() {
      if (!keyboardOn) {
        return EdgeInsets.symmetric(
          vertical: size.height * 0.05,
          horizontal: size.width * 0.05,
        );
      } else {
        return EdgeInsets.all(0);
      }
    }

    var _header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
            size: size.height * 0.035,
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        Text(
          "Easify",
          style: TextStyle(
            fontFamily: "Corbel",
            fontSize: size.height * 0.035,
            color: Colors.white,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.done_outline_rounded,
            color: Colors.white,
            size: size.height * 0.035,
          ),
          onPressed: () {
            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PreviousEntriesScreen()));
            databaseService.updateJournalEntry(widget.emotionId,
                getActiveAnchorsNames(), textEditingController.text.trim());
          },
        ),
      ],
    );

    Widget handleTextArea() {
      if (!keyboardOn) {
        return TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: size.height * 0.01,
              bottom: size.height * 0.01,
              left: size.width * 0.05,
              right: size.width * 0.05,
            ),
            hintText: "Start journaling here",
          ),
          maxLines: 18,
          keyboardType: TextInputType.multiline,
        );
      } else {
        return TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: size.height * 0.01,
              bottom: size.height * 0.01,
              left: size.width * 0.05,
              right: size.width * 0.05,
            ),
            hintText: "Start journaling here",
          ),
          maxLines: 14,
          keyboardType: TextInputType.multiline,
        );
      }
    }

    return Scaffold(
      body: Container(
        color: Colors.blue.shade200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: _header,
                margin: EdgeInsets.only(
                  top: size.height * 0.04,
                ),
              ),
              Container(
                margin: handleEmotionAndTextMargins(),
                width: size.width * 0.7,
                child: handleEmotionAndText(),
              ),
              Container(
                width: keyboardOn ? 0 : size.width,
                height: keyboardOn ? 0 : size.height * 0.09,
                margin: EdgeInsets.only(
                  left: keyboardOn ? 0 : size.width * 0.07,
                  right: keyboardOn ? 0 : size.width * 0.07,
                ),
                child: anchorsWidget,
              ),
              Container(
                margin: keyboardOn
                    ? EdgeInsets.symmetric(
                        vertical: size.height * .02,
                        horizontal: size.width * .05,
                      )
                    : EdgeInsets.symmetric(
                        vertical: size.height * 0.05,
                        horizontal: size.width * 0.05,
                      ),
                child: handleTextArea(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
