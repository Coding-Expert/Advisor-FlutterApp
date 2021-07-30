class Category {
  String categoryId;
  String categoryType;
  String categoryName;

  Category();

  Category.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      categoryId = jsonMap['CategoryID'] != null ? jsonMap['CategoryID'] : '';
      categoryType = jsonMap['CatType'] != null ? jsonMap['CatType'] : '';
      categoryName =
          jsonMap['CategoryName'] != null ? jsonMap['CategoryName'] : '';
    } catch (e) {
      print(e);
    }
  }
}
