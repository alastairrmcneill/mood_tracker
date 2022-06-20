import 'package:flutter/material.dart';

class Review {
  final DateTime date;
  final int rating;

  Review({required this.date, required this.rating});
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
