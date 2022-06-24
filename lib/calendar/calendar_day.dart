import 'package:flutter/material.dart';
import 'package:mood_tracker/models/review.dart';
import 'package:mood_tracker/theme.dart';
import 'package:mood_tracker/widgets/custom_dialog_box.dart';

class CalendarDay extends StatelessWidget {
  final bool showNote;
  final Review review;

  late Color color;
  CalendarDay({Key? key, required this.review, required this.showNote}) {
    color = MyColors.ratingColors[review.rating - 1];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showNote && review.note != ''
          ? () async {
              showAlertDialog(context: context, review: review);
            }
          : null,
      child: Container(
        width: 20,
        height: 20,
        color: color,
        child: showNote
            ? (review.note != '')
                ? Align(alignment: const Alignment(0.0, 0.5), child: CircleAvatar(radius: 4, backgroundColor: Theme.of(context).scaffoldBackgroundColor))
                : null
            : null,
      ),
    );
  }
}
