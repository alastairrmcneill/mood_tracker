import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/services/reviews_database.dart';
import 'package:mood_tracker/models/review.dart';

class AddReview extends StatefulWidget {
  final bool todayComplete;
  const AddReview({Key? key, required this.todayComplete}) : super(key: key);

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  List<bool> _selections = [false, false, false, false, false];
  final TextEditingController _textEditingController = TextEditingController();

  String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }

    switch (dayNum % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  List<Widget> buildButtons() {
    return [
      _selections[0] ? Icon(FontAwesomeIcons.solidFaceSadTear) : Icon(FontAwesomeIcons.faceSadTear),
      _selections[1] ? Icon(FontAwesomeIcons.solidFaceFrown) : Icon(FontAwesomeIcons.faceFrown),
      _selections[2] ? Icon(FontAwesomeIcons.solidFaceMeh) : Icon(FontAwesomeIcons.faceMeh),
      _selections[3] ? Icon(FontAwesomeIcons.solidFaceSmile) : Icon(FontAwesomeIcons.faceSmile),
      _selections[4] ? Icon(FontAwesomeIcons.solidFaceLaughBeam) : Icon(FontAwesomeIcons.faceLaughBeam),
    ];
  }

  Future addReview() async {
    int rating = _selections.indexOf(true) + 1;

    Review review = Review(
      date: DateTime.now(),
      rating: rating,
      note: _textEditingController.text.trim(),
    );

    await ReviewsDatabase.instance.createReview(review);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat("EEEE,  dd'${getDayOfMonthSuffix(DateTime.now().day)}' MMMM").format(DateTime.now())),
        actions: [
          IconButton(
              onPressed: !_selections.contains(true)
                  ? null
                  : () async {
                      await addReview();
                    },
              icon: const Icon(Icons.check_rounded))
        ],
      ),
      body: widget.todayComplete
          ? Center(child: Text('You have already done today!'))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'How did you feel today?',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  ToggleButtons(
                    children: buildButtons(),
                    isSelected: _selections,
                    onPressed: (index) {
                      setState(() {
                        for (int buttonIndex = 0; buttonIndex < _selections.length; buttonIndex++) {
                          if (buttonIndex == index) {
                            _selections[buttonIndex] = !_selections[buttonIndex];
                          } else {
                            _selections[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    selectedBorderColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    fillColor: Colors.transparent,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _textEditingController,
                    decoration: InputDecoration(labelText: 'What happened today'),
                  ),
                ],
              ),
            ),
    );
  }
}
