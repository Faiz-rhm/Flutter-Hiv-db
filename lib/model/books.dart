
import 'package:hive/hive.dart';

part 'books.g.dart';

@HiveType(typeId: 1)
class Books {
  Books(
    {
      this.id,
      this.title,
      this.author,
      this.description,
      this.imageUrl,
      this.link,
      this.category,
      this.language,
      this.publishedDate,
      this.publisher,
    }
  );

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? author;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? imageUrl;

  @HiveField(5)
  String? link;

  @HiveField(6)
  String? category;

  @HiveField(7)
  String? language;

  @HiveField(8)
  String? publishedDate;

  @HiveField(9)
  String? publisher;
}