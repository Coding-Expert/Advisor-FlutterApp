class PrivateReviewModel {
  bool status;
  String message;
  List<PrivateReview> privateLists = [];
  PrivateReviewModel();

  PrivateReviewModel.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      status = jsonMap['status'] != null ? jsonMap['status'] : "";
      message = jsonMap['message'] != null ? jsonMap['message'] : "";
      // privateLists = jsonMap['private_comment'] != null
      //     ? List.from(jsonMap['private_comment']).map((element) {
      //         return PrivateReview.fromJSON(element);
      //       }).toList()
      //     : [];
      if(jsonMap['private_comment'] != null){
        List.from(jsonMap['private_comment']).map((element) {
          if(privateLists.length > 0){
            int index = 0;
            for(int i = 0; i < privateLists.length; i++){
              if(element["MobileNo"] == privateLists[i].mobileNo){
                privateLists[i].comment = privateLists[i].comment + "\n" + element["Comment"];
                index = index + 1;
                break;
              }
              
            }
            if(index < 1){
              privateLists.add(PrivateReview.fromJSON(element));
            }
          }
          else{
            privateLists.add(PrivateReview.fromJSON(element));
          }
        }).toList();
      }
      else{

      }
      
    } catch (e) {
      message = "";
      privateLists = [];
    }
  }
}

class PrivateReview {
  String privateCommentId;
  String userId;
  String mobileNo;
  String comment;
  String createdAt;
  String modifiedAt;

  PrivateReview();

  PrivateReview.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      privateCommentId = jsonMap['PrivateCommentID'] != null
          ? jsonMap['PrivateCommentID']
          : "";
      userId = jsonMap['UserID'] != null ? jsonMap['UserID'] : "";
      mobileNo = jsonMap['MobileNo'] != null ? jsonMap['MobileNo'] : "";
      comment = jsonMap['Comment'] != null ? jsonMap['Comment'] : "";
      createdAt = jsonMap['CreatedDate'] != null ? jsonMap['CreatedDate'] : "";
      modifiedAt = jsonMap['ModifiedDate'] != null ? jsonMap['ModifiedDate'] : "";
    } catch (e) {
      privateCommentId = "";
      userId = "";
      mobileNo = "";
      comment = "";
      createdAt = "";
      modifiedAt = "";
    }
  }
}
