import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../helpers/helper.dart';
import '../models/review.dart';
import '../models/mobile_review.dart';
import '../models/private_review.dart';
import '../repository/ratting_repository.dart' as repository;

class RattingController extends ControllerMVC {
  ReviewModel reviewModel;
  MobileReviewModel mobileReviewModel;
  PrivateReviewModel privateReviewModel;

  GlobalKey<FormState> formKey;
  GlobalKey<ScaffoldState> scaffoldKey;

  OverlayEntry loader;

  RattingController() {
    formKey = new GlobalKey<FormState>();
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    loader = Helper.overlayLoader(context);
  }

  Future<ReviewModel> getReviewModel() async {
    repository.getReviewLists().then((res) {
      setState(() {
        reviewModel = ReviewModel.fromJSON(res);
      });
    });

    return reviewModel;
  }

  Future<MobileReviewModel> searchReview(String mobile) async {
    repository.searchReview(mobile).then((res) {
      setState(() {
        mobileReviewModel = MobileReviewModel.fromJSON(res);
      });
    });

    return mobileReviewModel;
  }

  Future<PrivateReviewModel> getPrivateReviewList() async {
    repository.getPrivateList().then((res) {
      setState(() {
        privateReviewModel = PrivateReviewModel.fromJSON(res);
      });
    });
    return privateReviewModel;
  }

  Future<PrivateReviewModel> getSearchPrivateReviewList(String mobile) async {
    repository.getSearchPrivateList(mobile).then((res) {
      setState(() {
        privateReviewModel = PrivateReviewModel.fromJSON(res);
      });
    });
    return privateReviewModel;
  }

  void addReview(String ratting, String categoryId, String mobile, String type,
      String comment) async {
    FocusScope.of(context).unfocus();
    // Overlay.of(context).insert(loader);
    repository
        .addReview(ratting, categoryId, mobile, type, comment)
        .then((res) {
      if (res['status'] == false) {
        Fluttertoast.showToast(msg: res["message"]);
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: res["message"]);
      }
    }).catchError((e) {
      loader.remove();
    }).whenComplete(() {
      Helper.hideLoader(loader);
    });
  }

  void addPrivateNote(String mobile, String comment) async {
    FocusScope.of(context).unfocus();
    Overlay.of(context).insert(loader);
    repository.addPrivateNote(mobile, comment).then((res) {
      if (res['status'] == false) {
        Fluttertoast.showToast(msg: res["message"]);
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: res["message"]);
      }
    }).catchError((e) {
      loader.remove();
    }).whenComplete(() {
      Helper.hideLoader(loader);
    });
  }

  void updatePrivateNote(String mobile, String comment, String id) async {
    FocusScope.of(context).unfocus();
    Overlay.of(context).insert(loader);
    repository.updatePrivateNote(mobile, comment, id).then((res) {
      if (res['status'] == false) {
        Fluttertoast.showToast(msg: res["message"]);
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: res["message"]);
      }
    }).catchError((e) {
      loader.remove();
    }).whenComplete(() {
      Helper.hideLoader(loader);
    });
  }

  Future<bool> deletePrivateNote(String id) async{
    bool result;
    repository.deletePrivateNote(id).then((res){
      if(res['status'] == false){
        result = false;
      }
      else{
        result = true;
      }
    });
    return result;
  }

  Future<bool> deleteAllPrivateNote() async{
    bool result;
    repository.deleteAllPrivateNote().then((res){
      if(res['status'] == false){
        result = false;
      }
      else{
        result = true;
      }
    });
    return result;
  }
}
