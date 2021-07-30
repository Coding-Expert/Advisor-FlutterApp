class ReviewModel {
  bool status;
  String username;
  List<Review> reviewLists;
  List<Review> otherReviewLists;

  ReviewModel();

  ReviewModel.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      status = jsonMap['status'] != null ? jsonMap['status'] : "";
      username = jsonMap['username'] != null ? jsonMap['username'] : "";
      reviewLists = jsonMap['reviews'] != null
          ? List.from(jsonMap['reviews']).map((element) {
              return Review.fromJSON(element);
            }).toList()
          : [];

      otherReviewLists = jsonMap['review_other'] != null
          ? List.from(jsonMap['review_other']).map((element) {
              return Review.fromJSON(element);
            }).toList()
          : [];
    } catch (e) {
      username = '';
      reviewLists = [];
      otherReviewLists = [];
      print(e);
    }
  }
}

class Review {
  String id;
  String ratting;
  String userId;
  String mobileNo;
  String type;
  String comment;
  String isDisplay;
  String categoryId;
  String createdDate;
  String createdOn;
  String modifiedOn;
  String totalReview;
  String categoryName;
  String postiveReview;
  String negativeReview;
  String neturalReview;

  Review();

  Review.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['ID'] != null ? jsonMap['ID'] : '';
      ratting = jsonMap['Ratting'] != null ? jsonMap['Ratting'] : '';
      userId = jsonMap['UserID'] != null ? jsonMap['UserID'] : '';
      mobileNo = jsonMap['MobileNo'] != null ? jsonMap['MobileNo'] : '';
      type = jsonMap['Type'] != null ? jsonMap['Type'] : '';
      comment = jsonMap['Comment'] != null ? jsonMap['Comment'] : '';
      isDisplay = jsonMap['IsDisplay'] != null ? jsonMap['IsDisplay'] : '';
      categoryId = jsonMap['CategoryID'] != null ? jsonMap['CategoryID'] : '';
      createdDate =
          jsonMap['CreatedDate'] != null ? jsonMap['CreatedDate'] : '';
      createdOn = jsonMap['CreatedOn'] != null ? jsonMap['CreatedOn'] : '';
      modifiedOn = jsonMap['ModifiedOn'] != null ? jsonMap['ModifiedOn'] : '';
      totalReview =
          jsonMap['total_review'] != null ? jsonMap['total_review'] : '';
      categoryName =
          jsonMap['categoryName'] != null ? jsonMap['categoryName'] : '';

      postiveReview =
          jsonMap['postive_review'] != null ? jsonMap['postive_review'] : '';

      negativeReview =
          jsonMap['negative_review'] != null ? jsonMap['negative_review'] : '';
      neturalReview =
          jsonMap['netural_review'] != null ? jsonMap['netural_review'] : '';
    } catch (e) {
      print(e);
    }
  }
}
