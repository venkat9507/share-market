import 'package:flutter/material.dart';
import 'package:flutter_sharemarket/constants/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/1.png'),fit: BoxFit.cover)
            ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.5,
              ),
              customText(Colors.white, 'Welcome', size.height * 0.03, FontWeight.bold),
              SizedBox(
                height: size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.07,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),topLeft:  Radius.circular(12),),
                        border: Border.all(color: Colors.grey.shade400)),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      validator: (String value) {
                        if (value.length < 3)
                          return " Enter at least 3 character from Customer Name";
                        else
                          return null;
                      },
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      // controller: shopNameController,
                      onChanged: (value){
                        // itemName = value;
                      },
                      autofillHints: [AutofillHints.givenName],
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText:'Phone No:' ,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontSize: size.width * 0.05,
                        ),
                        // hoverColor: Colors.white,
                        filled: true,
                        // focusColor: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.07,
                    width: size.width * 0.15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight:  Radius.circular(12),),
                        border: Border.all(color: Colors.grey.shade400)),
                    child:  IconButton(icon: Icon(Icons.arrow_forward_sharp,color: Colors.black,), onPressed: (){}),
                  ),

                ],
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  height: size.height * 0.1,
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                    // color: Colors.yellow,
                      image: DecorationImage(image: AssetImage('assets/2.png'),fit: BoxFit.contain,),
                    // borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child:Padding(
                    padding: EdgeInsets.only(left: size.height * 0.13,top: size.height * 0.03,),
                    child: customText(Colors.white, 'Login', size.height * 0.03, FontWeight.bold),),
                ),
              )
            ],
          ),
          ),
      ),
    );
  }
}
