import 'package:bankx/pages/loans/biom.dart';
import 'package:bankx/pages/loans/contratopdf.dart';
import 'package:bankx/pages/loans/pago.dart';
import 'package:flutter/material.dart';
import 'package:bankx/pages/screens.dart';

class AutorizacionPage extends StatefulWidget {
  static const String routeName = '/autorizacion';

  @override
  _AutorizacionPageState createState() => _AutorizacionPageState();
}

class _AutorizacionPageState extends State<AutorizacionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Autorización',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace,
              Container(
                alignment: Alignment.center,
              ),
              height5Space,
              countinueButton(),
            ],
          ),
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
          child: ContratopdfPage(),
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
          'Siguiente',
          style: black18BoldTextStyle,
        ),
      ),
    );
  }
}
