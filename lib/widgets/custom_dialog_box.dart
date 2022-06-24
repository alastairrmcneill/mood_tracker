import 'package:flutter/material.dart';
import 'package:mood_tracker/models/review.dart';
import 'package:mood_tracker/theme.dart';
import 'package:mood_tracker/widgets/rating_icons.dart';

// 1 button Dialog
showAlertDialog({required BuildContext context, required Review review}) {
  Dialog alert = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
          height: 350.0,
          width: 200.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(height: 150.0),
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        color: MyColors.ratingColors[review.rating - 1]),
                  ),
                  Positioned(
                    top: 50.0,
                    left: 94.0,
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45.0),
                        border: Border.all(color: Colors.white, style: BorderStyle.solid, width: 2.0),
                        color: Colors.white,
                      ),
                      child: FittedBox(
                        child: RatingIcons.solidIcons[review.rating - 1],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      child: Text(
                        review.note,
                        style: const TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )),
              ),
              const SizedBox(height: 10.0),
              TextButton(
                child: Center(
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      color: MyColors.ratingColors[review.rating - 1],
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          )));

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
