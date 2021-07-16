import 'package:flutter/material.dart';
import 'package:flutter_sharemarket/constants/controller.dart';
import 'package:flutter_sharemarket/constants/text_widget.dart';
import 'package:get/get.dart';


Future FloatingMessage() {
  return Get.defaultDialog(
      title: 'Update',titleStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20,),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15,left: 15),
            child: TextFormField(
              maxLines: 1,
              style: TextStyle( color: Colors.green.shade100,),
              validator: (String value) {
                if (value.length < 3)
                  return " Enter at least 3 character from Customer Name";
                else
                  return null;
              },
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text,
              controller: dashboardController.messageTitleController,
              onChanged: (value){
                // itemName = value;
              },
              autofillHints: [AutofillHints.givenName],
              decoration: InputDecoration(enabled: true,counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green.shade100,)),
                hintText:'Title / Stock Name' ,
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
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15,left: 15),
            child: TextFormField(
              maxLines: 5,
              style: TextStyle( color: Colors.green.shade100,),
              validator: (String value) {
                if (value.length < 3)
                  return " Enter at least 3 character from Customer Name";
                else
                  return null;
              },
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text,
              controller: dashboardController.messageController,
              onChanged: (value){
                // itemName = value;
              },
              autofillHints: [AutofillHints.givenName],
              decoration: InputDecoration(enabled: true,counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green.shade100,)),
                hintText:'Message' ,
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
            height: size.height * 0.05,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: TextButton(onPressed: (){
                dashboardController.messageSent();
              }, child:  customText(Colors.green, 'SEND', height * 0.03, FontWeight.bold),))
        ],
      )
  );
}

