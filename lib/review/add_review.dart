import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/services/reviews_database.dart';
import 'package:mood_tracker/models/review.dart';
import 'package:mood_tracker/theme.dart';
import 'package:mood_tracker/widgets/rating_icons.dart';

class AddReview extends StatefulWidget {
  final bool todayComplete;
  const AddReview({Key? key, required this.todayComplete}) : super(key: key);

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  List<bool> _selections = [false, false, false, false, false, false];
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
      _selections[0] ? RatingIcons.icon1Solid : RatingIcons.icon1,
      _selections[1] ? RatingIcons.icon2Solid : RatingIcons.icon2,
      _selections[2] ? RatingIcons.icon3Solid : RatingIcons.icon3,
      _selections[3] ? RatingIcons.icon4Solid : RatingIcons.icon4,
      _selections[4] ? RatingIcons.icon5Solid : RatingIcons.icon5,
      _selections[5] ? RatingIcons.icon6Solid : RatingIcons.icon6,
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
          ? Center(
              child: Text(
                'You have already done today!',
                style: Theme.of(context).textTheme.headline5,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'How did you feel today?',
                    style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
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
                    decoration: InputDecoration(
                      labelText: 'What happened today',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: MyColors.rating5,
                        ),
                      ),
                      labelStyle: TextStyle(color: MyColors.rating5),
                    ),
                    minLines: 3,
                    maxLines: 10,
                    cursorColor: MyColors.rating5,
                    style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
    );
  }
}
