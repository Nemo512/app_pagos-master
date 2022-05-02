import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:bankx/pages/screens.dart';
import 'package:lottie/lottie.dart';
import 'solformone.dart';

class AprobadoPage extends StatefulWidget {
  static const String routeName = '/aprobado';

  @override
  _AprobadoPageState createState() => _AprobadoPageState();
}

class _AprobadoPageState extends State<AprobadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Crédito Aprobado',
          style: black18BoldTextStyle,
        ),
        toolbarHeight: 50, // default is 56
        toolbarOpacity: 0.5,
        shape: StadiumBorder(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: orangeColor,
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
                    'https://assets6.lottiefiles.com/packages/lf20_99qmhngb.json'),
                height20Space,
                Text('¡Felicidades!',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    )),
                Text('Tú préstamo fue aprobado por 20,000MXN',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    )),
                height20Space,
                countinueButton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  countinueButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: SolformonePage(),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        padding: EdgeInsets.symmetric(
          vertical: fixPadding + 4.0,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          'Iniciar Solicitud',
          style: black18BoldTextStyle,
        ),
      ),
    );
  }
}
