import 'package:flutter/material.dart';
import 'package:mood_tracker/models/review.dart';
import 'package:mood_tracker/widgets/custom_dialog_box.dart';

class CalendarDay extends StatelessWidget {
  final bool showNote;
  final Review review;
  final List<Color> colors = const [
    Color(0xffff5999),
    Color(0xFFff70a6),
    Color(0xFFff70a6),
    Color(0xff3daeb4),
    Color(0xFF109da4),
    Color(0xFF0e838a),
  ];
  late Color color;
  CalendarDay({Key? key, required this.review, required this.showNote}) {
    color = colors[review.rating - 1];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showNote && review.note != ''
          ? () async {
              showAlertDialog(context: context, title: 'Note', message: review.note);
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
