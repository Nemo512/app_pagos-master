import 'package:bankx/pages/loans/autorizacion.dart';
import 'package:flutter/material.dart';
import 'package:bankx/pages/screens.dart';

class DeclaraPage extends StatefulWidget {
  static const String routeName = '/declara';

  @override
  _DeclaraPageState createState() => _DeclaraPageState();
}

class _DeclaraPageState extends State<DeclaraPage> {
  String _value = 'Institución';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Declaraciones',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace,
              Container(
                alignment: Alignment.center,
              ),
              height5Space,
              tpDropdown(),
              height20Space,
              customerpuestoTextField(),
              height20Space,
              customerparentTextField(),
              height20Space,
              fpDropdown(),
              height20Space,
              customerpuesto2TextField(),
              height20Space,
              countinueButton(),
            ],
          ),
        ],
      ),
    );
  }

  tpDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding + 35.0,
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
            "Si",
            "No",
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
          hint: Text("¿Familiar con cargo político?")),
    );
  }

  fpDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding + 46.0,
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
            "Si",
            "No",
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
          hint: Text("¿Tengo un cargo político?")),
    );
  }

  customerpuestoTextField() {
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
          hintText: 'Puesto',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerpuesto2TextField() {
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
          hintText: 'Puesto',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerparentTextField() {
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
          hintText: 'Parentesco',
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
          child: AutorizacionPage(),
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
