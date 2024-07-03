/* the api returns a list of categories but with out the key so we could have not made a model at all 
but to make it easier and more readableal and maintainable we made the model */
class Category {
  final String name;

  Category({
    required this.name,
  });

  factory Category.fromJson(dynamic json) {
    return Category(
      name: json as String,
    );
  }
}
