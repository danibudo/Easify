import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  static const String depressionDef =
      "Characterized by a negative emotional state, depression is a complex problem that affects many aspects of life. Depression is a negative mental state and aversion to activity, which can affect a person's thoughts, behavior, feelings and sense of well-being.";
  static const String depressionManif =
      "Depressive moods (to children, irritable moods); a marked decrease in interest and pleasure in most activities; significant weight loss / gain (5% of G) (to children, they do not reach the appropriate weight for age); insomnia / hypersomnia; agitation / slowness; fatigue / decreased energy; feelings of worthlessness; excessive or inappropriate guilt; decreased ability to think and concentrate, indecision; recurrent thoughts of death / suicide; suicide plan / attempt.";
  static const String depressionCoping =
      "Note your thoughts / emotions whenever you feel they overwhelm you; describe what you feel as acurate as you can;keep a journal; change your routine (e.g. Monday is movie day, Tuesday is self-care day etc.); go to a psychotherapist; rewards for small victories (e.g. you attended the first painting course, the reward may be a bath with essential oils and your favorite sparkling wine, etc.)";

  static const String anxietyDef =
      "Anxiety implies an anticipation, an expectation of future threats, without the need for the presence of stimuli. Anxiety is an uncontrollable concern about various events or activities in our lives (e.g. exams, school, etc.). Thus, it differs from fear in that the latter is an emotional response to real dangers or the perception of an imminent threat.";
  static const String anxietyManif =
      "Anxiety is more frequently associated with muscle tension and increased alertness to help us prepare for future dangers (a state of permanent alert); caution or avoidance behaviors; fatigue; feeling of pressure; irritability; insomnia; concentrating difficulties.";
  static const String anxietyCoping =
      "Breathing techniques (4-7-8 Breathing method), guided meditation, watching your favorite movie, watching a comedy movie / series, listening to music, physical exercise (eg yoga, running, dancing around the house, etc.), gradual exposure to situations causing distress, talking to a loved one, hugging someone.";

  static const String selfEsteemDef =
      "The term self-esteem was first coined by William James in 1890, which makes it one of the oldest concepts in psychology.define self-esteem as the disposition to experience oneself as being competent to cope with the basic challenges of life and of being worthy of happiness. The self-concept has three different components: the view you have of yourself (self-image); how much value you place on yourself (self-esteem or self-worth); and what you wish you were really like (ideal-self).";
  static const String selfEsteemManif =
      "High self-esteem refers to positive view of ourselves which tends to lead to confidence in our own abilities; self-acceptance; optimism and not worrying about what others think. On the other hand, lower self-esteem refers to negative view of ourselves which tends to lead to lack of confidence; desire to be/look like someone else; always worrying what others might think about ourselves";
  static const String selfEsteemCoping =
      "Physical exercises/physical activities; surround yourself with positive people, your dear ones; adopt an animal; note your daily success; make a list of things you are greatful for; dso something you are good at; have a day a week for yourself only.";

  int topicId;
  TextWidget({@required this.topicId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    switch (topicId) {
      case 0:
        {
          return Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                  ),
                  child: Text(
                    "What is it?",
                    style: TextStyle(
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  depressionDef,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                  ),
                  child: Text(
                    "Symptoms and Manifestation",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  depressionManif,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                  ),
                  child: Text(
                    "How to cope",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  depressionCoping,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }
      case 1:
        {
          return Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                  ),
                  child: Text(
                    "What is it?",
                    style: TextStyle(
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(anxietyDef),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                  ),
                  child: Text(
                    "Symptoms and Manifestation",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(anxietyManif),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                  ),
                  child: Text(
                    "How to cope",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(anxietyCoping),
              ],
            ),
          );
        }
      case 2:
        {
          return Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                  ),
                  child: Text(
                    "What is it?",
                    style: TextStyle(
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(selfEsteemDef),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                  ),
                  child: Text(
                    "Symptoms and Manifestation",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(selfEsteemManif),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                  ),
                  child: Text(
                    "How to cope (with low self-esteem)",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(selfEsteemCoping),
              ],
            ),
          );
        }
      default:
        return Text("error");
    }
  }
}
