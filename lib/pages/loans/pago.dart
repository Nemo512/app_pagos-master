import 'package:bankx/pages/loans/dinanim.dart';
import 'package:flutter/material.dart';
import 'package:bankx/pages/screens.dart';

class PagoPage extends StatefulWidget {
  static const String routeName = '/pago';

  @override
  _PagoPageState createState() => _PagoPageState();
}

class _PagoPageState extends State<PagoPage> {
  String _value = 'Institución';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Método de Pago',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              heightSpace,
              Container(
                alignment: Alignment.center,
              ),
              height5Space,
              Text("¿A dónde desea usted que se le transfieran los fondos?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  )),
              height20Space,
              height20Space,
              height20Space,
              pagoDropdown(),
              height20Space,
              height20Space,
              customercuentaTextField(),
              height20Space,
              height20Space,
              countinueButton(),
            ],
          ),
        ],
      ),
    );
  }

  pagoDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding + 73.0,
        vertical: fixPadding - 6.0,
      ),
      decoration: BoxDecoration(
        color: camposColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: primaryColor.withOpacity(0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton(
          // value: _value,
          items: <String>[
            "CLABE",
            "No. de Cuenta",
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String value) {
            setState(() {
              _value = value;
            });
          },
          hint: Text("Forma de depósito")),
    );
  }

  customercuentaTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding + 5.0,
        vertical: fixPadding - 6.0,
      ),
      decoration: BoxDecoration(
        color: camposColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Escribir CLABE ó Cuenta',
          border: InputBorder.none,
        ),
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
          child: DinanimPage(),
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
