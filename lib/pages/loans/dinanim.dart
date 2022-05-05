import 'dart:async';

import 'package:bankx/pages/loans/confirm.dart';
import 'package:flutter/material.dart';
import 'package:bankx/pages/screens.dart';
import 'package:lottie/lottie.dart';

class DinanimPage extends StatefulWidget {
  static const String routeName = '/dinanim';

  @override
  _DinanimPageState createState() => _DinanimPageState();
}

class _DinanimPageState extends State<DinanimPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ConfirmPage()));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Depositando...',
          style: black18BoldTextStyle,
        ),
        toolbarHeight: 50, // default is 56
        toolbarOpacity: 0.5,
        shape: StadiumBorder(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.network(
                    'https://assets2.lottiefiles.com/packages/lf20_qzsgm3gz.json'),
                height20Space,
                Text('Tú dinero va en camino',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
