class RecommendStockModel {
  static const TARGETPRICE = 'targetPrice';
  static const STOCKNAME = 'stockName';
  static const OPENPRICE = 'openPrice';
  static const DATE = 'date';


  String targetPrice;
  String stockName;
  String openPrice;
  String date;
  RecommendStockModel({this.date,this.openPrice,this.stockName,this.targetPrice});

  RecommendStockModel.fromMap(Map<String, dynamic> data){
    targetPrice = data[TARGETPRICE];
    stockName = data[STOCKNAME];
    openPrice = data[OPENPRICE];
    date = data[DATE];
  }
}