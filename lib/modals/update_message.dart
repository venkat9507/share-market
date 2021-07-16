class updatemessageModel {
  static const STOCKNAME = 'stockName';
  static const MESSAGE = 'message';
  static const DATE = 'date';


  String stockName;
  String message;
  String date;
  updatemessageModel({this.date,this.stockName,this.message});

  updatemessageModel.fromMap(Map<String, dynamic> data){
    stockName = data[STOCKNAME];
    message = data[MESSAGE];
    date = data[DATE];
  }
}