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
