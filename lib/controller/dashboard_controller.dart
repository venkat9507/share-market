import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sharemarket/constants/firebase_constants.dart';
import 'package:flutter_sharemarket/modals/recommend_stocks.dart';
import 'package:flutter_sharemarket/modals/update_message.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  static DashboardController instance = Get.find();
  RxBool addedStock = false.obs;
  RxList<RecommendStockModel> recommendedStockList = RxList<RecommendStockModel>([]);
  RxList<updatemessageModel> updateMessageAlertList = RxList<updatemessageModel>([]);
  TextEditingController stockNameController = TextEditingController();
  TextEditingController targetPriceController = TextEditingController();
  TextEditingController openPriceController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController messageTitleController = TextEditingController();
  final List<Tab> tabs = <Tab>[
    Tab(text: 'Recommended Stock'),
    Tab(text: 'Update'),
    Tab(text: 'Report'),
  ];

  Stream<List<RecommendStockModel>> getRecommendedStockList() => firebaseFirestore.collection('recommendedStocks').snapshots().map((query) => query.docs.map((e) =>
    RecommendStockModel.fromMap(e.data())).toList());

  Stream<List<updatemessageModel>> getupdatedMessageAlert() => firebaseFirestore.collection('messageAlert').snapshots().map((query) => query.docs.map((e) =>
      updatemessageModel.fromMap(e.data())).toList());


  @override
  void onReady() {
    // TODO: implement onReady
    recommendedStockList.bindStream(getRecommendedStockList());
    updateMessageAlertList.bindStream(getupdatedMessageAlert());
    super.onReady();

  }
  // @override
  // onInit()  {
  //   // TODO: implement onInit
  //   super.onInit();
  //   recommendedStockList.bindStream(getRecommendedStockList());
  //   // getRecommendedStockList();
  //   // await firebaseFirestore.collection('recommendedStocks').get().then((value) {
  //   //  print(value.docs.map((e) => e));
  //   //   print(value.docs.map((e) => null));
  //   // });
  // }


  messageSent() async{
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var todayDate =
    DateFormat('dd-MM-yyyy').format(DateTime.parse(dateParse.toString()));
    if(messageController.text !=''){
      return
          await firebaseFirestore.collection('messageAlert').doc().set({
            'stockName':messageTitleController.text,
            'message':messageController.text,
            'date': todayDate.toString(),
          }).then((value) {
            messageController.text = '';
            Get.back();
            Get.snackbar('Successful', 'Updated Successfully',
                colorText: Colors.green,
                backgroundColor: Colors.transparent,
                duration: Duration(
                  seconds: 3,
                ),
                snackPosition: SnackPosition.TOP);
          });
    }
    else {
      Get.snackbar('Warning', 'Please fill the above 3 fields',
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: Duration(
            seconds: 3,
          ),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  addedToStock() async {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var todayDate =
    DateFormat('dd-MM-yyyy').format(DateTime.parse(dateParse.toString()));
    if (stockNameController.text != '' &&
        targetPriceController.text != '' &&
        openPriceController.text != '') {
      return
          await FirebaseFirestore.instance.collection('recommendedStocks').doc().set({
            'stockName': stockNameController.text,
            'targetPrice':targetPriceController.text,
            'openPrice':openPriceController.text,
            'date': todayDate.toString(),
          }).then((value){
            stockNameController.text = '' ;
                targetPriceController.text = '' ;
                openPriceController.text = '' ;
                Get.back();
            Get.snackbar('Successful', 'Updated Successfully',
                colorText: Colors.green,
                backgroundColor: Colors.transparent,
                duration: Duration(
                  seconds: 3,
                ),
                snackPosition: SnackPosition.TOP);
          });
    } else {
      Get.snackbar('Warning', 'Please fill the above 3 fields',
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: Duration(
            seconds: 3,
          ),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

}
