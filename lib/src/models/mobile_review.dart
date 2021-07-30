class MobileReviewModel {
  bool status;

  String postiveReview;
  String negativeReview;
  String neturalReview;

  List<MobileReview> reviewLists;

  MobileReviewModel();

  MobileReviewModel.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      status = jsonMap['status'] != null ? jsonMap['status'] : "";
      postiveReview = jsonMap['postive_review:'] != null
          ? jsonMap['postive_review:'].toString()
          : "";
      negativeReview = jsonMap['negative_review::'] != null
          ? jsonMap['negative_review::'].toString()
          : "";
      neturalReview = jsonMap['netural_review:::'] != null
          ? jsonMap['netural_review:::'].toString()
          : "";
      reviewLists = jsonMap['reviews'] != null
          ? List.from(jsonMap['reviews']).map((element) {
              return MobileReview.fromJSON(element);
            }).toList()
          : [];
    } catch (e) {
      postiveReview = '';
      negativeReview = '';
      neturalReview = '';
      reviewLists = [];

      print(e);
    }
  }
}

class MobileReview {
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
  String username;
  String profile;
  String categoryName;

  MobileReview();

  MobileReview.fromJSON(Map<String, dynamic> jsonMap) {
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
      username = jsonMap['username'] != null ? jsonMap['username'] : '';
      profile = jsonMap['profile'] != null ? jsonMap['profile'] : '';
      categoryName =
          jsonMap['categoryName'] != null ? jsonMap['categoryName'] : '';
    } catch (e) {
      print(e);
    }
  }
}
