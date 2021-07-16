import 'package:flutter/material.dart';
import 'package:flutter_sharemarket/constants/controller.dart';
import 'package:flutter_sharemarket/constants/text_widget.dart';
import 'package:get/get.dart';



Column RecommendedStockWidget() {
  return Column(
    children: [
      Container(

        child: Image.asset('assets/3.png'),
      ),
      SizedBox(
        height: height * 0.1,
        width: width * 0.6,
        child: InkWell(
          onTap: (){
            dashboardController.addedStock.value = !dashboardController.addedStock.value;

          },
          child: Card(
            color: Color(0xFFEEFFEB),
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline_rounded,
                  color: Colors.green,
                  size: width * 0.05,
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                customText(Colors.green, 'Add stock', height * 0.03, FontWeight.bold),
              ],
            ),
          ),
        ),
      ),
      dashboardController.addedStock.value == true ? Container(
        height: size.height * 0.07,
        width: size.width * 0.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: Colors.green.shade400,width: 2)),
        child: TextFormField(
          style: TextStyle( color: Colors.green.shade100,),
          validator: (String value) {
            if (value.length < 3)
              return " Enter at least 3 character from Customer Name";
            else
              return null;
          },
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.text,
          controller: dashboardController.stockNameController,
          onChanged: (value){
            // itemName = value;
          },
          onFieldSubmitted: (val){
            AdddedStocks();
          },
          autofillHints: [AutofillHints.givenName],
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText:'Stock Name' ,
            hintStyle: TextStyle(
              color: Colors.green.shade100,
              fontStyle: FontStyle.normal,
              fontSize: size.width * 0.05,
            ),
            // hoverColor: Colors.white,
            filled: true,
            // focusColor: Colors.white
          ),
        ),
      ): Container(),
      SizedBox(
        width: width ,
        child: Card(
          color: Colors.green,
          child: TabBar(
            indicatorColor: Colors.white,
            tabs: dashboardController.tabs,
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey.shade300,
            indicatorPadding:
            EdgeInsets.symmetric(horizontal: 24.0),
          ),
        ),
      ),
      TabbarView(),
    ],
  );
}






Future AdddedStocks() {
  return Get.defaultDialog(
    title: 'Stocks',
    content:  Column(
      children: [
        SizedBox(
          height: size.height * 0.05,
          child: Card(
            color: Colors.green,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: customText(Colors.white, 'LTP:3321224', size.width * 0.05, FontWeight.normal),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Container(
          height: size.height * 0.07,
          width: size.width * 0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: Colors.green.shade400,width: 2)),
          child: TextFormField(
            style: TextStyle( color: Colors.green.shade100,),
            validator: (String value) {
              if (value.length < 3)
                return " Enter at least 3 character from Customer Name";
              else
                return null;
            },
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.text,
            controller: dashboardController.targetPriceController,
            onChanged: (value){
              // itemName = value;
            },
            autofillHints: [AutofillHints.givenName],
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText:'Target' ,
              hintStyle: TextStyle(
                color: Colors.green.shade100,
                fontStyle: FontStyle.normal,
                fontSize: size.width * 0.05,
              ),
              // hoverColor: Colors.white,
              filled: true,
              // focusColor: Colors.white
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Container(
          height: size.height * 0.07,
          width: size.width * 0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: Colors.green.shade400,width: 2)),
          child: TextFormField(
            style: TextStyle( color: Colors.green.shade100),
            validator: (String value) {
              if (value.length < 3)
                return " Enter at least 3 character from Customer Name";
              else
                return null;
            },
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.text,
            controller: dashboardController.openPriceController,
            onChanged: (value){
              // itemName = value;
            },
            autofillHints: [AutofillHints.givenName],
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText:'Open Price' ,
              hintStyle: TextStyle(
                color: Colors.green.shade100,
                fontStyle: FontStyle.normal,
                fontSize: size.width * 0.05,
              ),
              // hoverColor: Colors.white,
              filled: true,
              // focusColor: Colors.white
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        InkWell(
          onTap: (){
            dashboardController.addedToStock();
          },
          child: Container(
              height: size.height * 0.04,
              width: size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF3D9426),
                    const Color(0xFF1F4A13),
                  ],
                  begin: const FractionalOffset(0.0, 2.0),
                  end: const FractionalOffset(1.0, 1.9),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Center(
                child: customText(Colors.white, 'ADD', size.height * 0.02, FontWeight.bold),
              )
          ),
        )
      ],
    ),
  );
}



Expanded TabbarView() {
  return Expanded(
    child: TabBarView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: dashboardController.recommendedStockList.length,
                    itemBuilder: (context,int index){
                      return
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Color(0xFFEEFFEB),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Wrap(
                                    spacing: 10,
                                    direction: Axis.vertical,
                                    children: [
                                      customText(Colors.black, dashboardController.recommendedStockList[index].stockName, width * 0.03, FontWeight.bold),
                                      Row(
                                        children: [
                                          customText(Colors.green, 'LTP:', width * 0.02, FontWeight.normal),
                                          customText(Colors.black, '2563.45', width * 0.02, FontWeight.normal),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          customText(Colors.green, 'RP:', width * 0.02, FontWeight.normal),
                                          customText(Colors.black, dashboardController.recommendedStockList[index].openPrice, width * 0.02, FontWeight.normal),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          customText(Colors.green, 'TP:', width * 0.02, FontWeight.normal),
                                          customText(Colors.black, dashboardController.recommendedStockList[index].targetPrice, width * 0.02, FontWeight.normal),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    spacing: 20,
                                    direction: Axis.vertical,
                                    children: [
                                      Card(
                                        child:  Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              customText(Colors.black, 'CHNG:', width * 0.03, FontWeight.normal),
                                              customText(Colors.green, '+0.10', width * 0.03, FontWeight.normal),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Center(child: Text(dashboardController.recommendedStockList[index].date,style: TextStyle(fontSize:width * 0.02, ),textAlign: TextAlign.center,)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                    })
              ],
            ),
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: dashboardController.updateMessageAlertList.length,
              itemBuilder: (context,int index){
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: Card(
                 color: Color(0xFFEEFFEB),
                 child:Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       customText(Colors.black, dashboardController.updateMessageAlertList[index].stockName, 15, FontWeight.bold),
                       SizedBox(
                         height: height * 0.02,
                       ),
                       customText(Colors.black, dashboardController.updateMessageAlertList[index].message, 10, FontWeight.normal),

                     ],
                   ),
                 )
               ),
             );
           }
         ),
          Text('Recommended Stock',style: TextStyle(color: Colors.green),),
        ]),
  );
}