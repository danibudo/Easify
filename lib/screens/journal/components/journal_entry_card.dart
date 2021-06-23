import 'package:flutter/material.dart';

class JournalEntryCard extends StatelessWidget {
  int emotionId;
  List<String> anchors;
  String text;
  double width;
  JournalEntryCard(
      {@required this.emotionId,
      @required this.anchors,
      @required this.text,
      @required this.width});
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

  Widget fetchContainerWithAllAnchors() {
    List<Widget> widgetAnchors = [];
    for (var anchor in anchors) {
      widgetAnchors.add(Container(
        child: Text(anchor),
        padding: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade100,
        ),
      ));
      widgetAnchors.add(SizedBox(
        width: 10,
      ));
    }
    if (anchors.length < 4) {
      return Row(
        children: widgetAnchors,
        mainAxisAlignment: MainAxisAlignment.start,
      );
    } else if (anchors.length < 7) {
      return Column(
        children: [
          Row(
            children: widgetAnchors.sublist(0, 5),
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: widgetAnchors.sublist(6, widgetAnchors.length),
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: widgetAnchors.sublist(0, 6),
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: widgetAnchors.sublist(6, 11),
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: widgetAnchors.sublist(12, widgetAnchors.length),
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        width: width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, left: 15),
              child: Row(
                children: [
                  Container(
                    child: Image.asset(
                        'assets/images/emojis/' + _emotionPicNames[emotionId]),
                    width: 35,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    child: fetchContainerWithAllAnchors(),
                    width: 260,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3,
              ),
              child: Text(text),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
