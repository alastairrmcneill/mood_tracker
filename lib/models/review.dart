import 'package:flutter/material.dart';

final String tableReviews = 'reviews';

class ReviewFields {
  static final List<String> values = [id, date, rating, note];

  static final String id = '_id';
  static final String date = 'date';
  static final String rating = 'rating';
  static final String note = 'note';
}

class Review {
  final int? id;
  final DateTime date;
  final int rating;
  final String note;

  Review({this.id, required this.date, required this.rating, this.note = ''});

  static Review fromJSON(json) {
    return Review(
        id: json[ReviewFields.id] as int?,
        date: DateTime.fromMillisecondsSinceEpoch(json[ReviewFields.date] as int),
        rating: json[ReviewFields.rating] as int,
        note: json[ReviewFields.note] as String);
  }

  Map<String, Object?> toJSON() {
    return {
      ReviewFields.id: id,
      ReviewFields.date: date.millisecondsSinceEpoch,
      ReviewFields.rating: rating,
      ReviewFields.note: note,
    };
  }

  Review copy({
    int? id,
    DateTime? date,
    int? rating,
    String? note,
  }) =>
      Review(
        id: id ?? this.id,
        date: date ?? this.date,
        rating: rating ?? this.rating,
        note: note ?? this.note,
      );
}

List<Review> reviewsData = [
  Review(date: DateTime(2021, 1, 10), rating: 1),
  Review(date: DateTime(2021, 1, 11), rating: 2),
  Review(date: DateTime(2021, 1, 12), rating: 3),
  Review(date: DateTime(2022, 1, 13), rating: 4),
  Review(date: DateTime(2022, 1, 14), rating: 5),
  Review(date: DateTime(2022, 1, 15), rating: 1),
  Review(date: DateTime(2022, 1, 16), rating: 6),
  Review(date: DateTime(2022, 1, 17), rating: 4),
  Review(date: DateTime(2022, 1, 18), rating: 2),
  Review(date: DateTime(2022, 1, 21), rating: 1),
  Review(date: DateTime(2022, 1, 22), rating: 5),
  Review(date: DateTime(2022, 1, 23), rating: 6),
  Review(date: DateTime(2022, 2, 1), rating: 6),
  Review(date: DateTime(2022, 2, 2), rating: 3),
  Review(date: DateTime(2022, 2, 3), rating: 3),
  Review(date: DateTime(2022, 2, 4), rating: 4),
  Review(date: DateTime(2022, 2, 5), rating: 5),
  Review(date: DateTime(2022, 2, 6), rating: 1),
  Review(date: DateTime(2022, 2, 11), rating: 2),
  Review(date: DateTime(2022, 2, 12), rating: 6),
  Review(date: DateTime(2022, 3, 1), rating: 3),
];
