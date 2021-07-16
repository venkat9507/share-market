import 'package:flutter/material.dart';
import 'package:flutter_sharemarket/constants/controller.dart';
import 'package:flutter_sharemarket/constants/text_widget.dart';
import 'package:flutter_sharemarket/widgets/floating_message.dart';
import 'package:flutter_sharemarket/widgets/recommended_stocks_widgets.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
   // print( dashboardController.recommendedStockList.first.stockName);
    return Obx(
      ()=> SafeArea(
        child: DefaultTabController(
          length: dashboardController.tabs.length,
          child: Scaffold(
            floatingActionButton: InkWell(
              onTap: (){
                FloatingMessage();
              },
              child: Container(
                height: 50,
                  width: 50,
                  // margin: EdgeInsets.all(100.0),
                  decoration: BoxDecoration(
                      color:   Colors.green,
                      shape: BoxShape.circle
                  ),
                  child: Icon(Icons.message,color: Colors.white,)),
            ),
            body: RecommendedStockWidget(),
          ),
        ),
      ),
    );
  }


}
