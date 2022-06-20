import 'package:sqflite/sqflite.dart';
import 'package:mood_tracker/models/review.dart';
import 'package:path/path.dart';

class ReviewsDatabase {
  static final ReviewsDatabase instance = ReviewsDatabase._init();
  static Database? _database;

  ReviewsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('reviews.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute("""
    CREATE TABLE $tableReviews (
      ${ReviewFields.id} $idType,
      ${ReviewFields.date} $integerType,
      ${ReviewFields.rating} $integerType,
      ${ReviewFields.note} $textType
    )
    """);
  }

  Future<Review> createReview(Review review) async {
    final db = await instance.database;
    final id = await db.insert(tableReviews, review.toJSON());
    return review.copy(id: id);
  }

  Future<Review> readReview(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableReviews,
      columns: ReviewFields.values,
      where: '${ReviewFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Review.fromJSON(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Review>> readAllReviews() async {
    final db = await instance.database;
    final orderBy = '${ReviewFields.date} ASC';
    final result = await db.query(tableReviews, orderBy: orderBy);

    return result.map((json) => Review.fromJSON(json)).toList();
  }

  Future<int> update(Review review) async {
    final db = await instance.database;

    return db.update(
      tableReviews,
      review.toJSON(),
      where: '${ReviewFields.id} = ?',
      whereArgs: [review.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableReviews,
      where: '${ReviewFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
