import 'package:bankx/pages/loans/confirm.dart';
import 'package:bankx/pages/loans/declara.dart';
import 'package:flutter/material.dart';
import 'package:bankx/pages/screens.dart';
import 'package:intl/intl.dart';

class SolformtrePage extends StatefulWidget {
  static const String routeName = '/solformtre';

  @override
  _SolformtrePageState createState() => _SolformtrePageState();
}

class _SolformtrePageState extends State<SolformtrePage> {
  final dateTimeController = TextEditingController(text: '21 Mar 20, 11:45am');

  DateTime selectedDate = DateTime(2021, 3, 20, 11, 45);
  String time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Datos Laborales',
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              height20Space,
              customerTipoTextField(),
              height20Space,
              customerLugarTextField(),
              height20Space,
              customerAntigTextField(),
              height20Space,
              height20Space,
              dateTimeTextField(),
              height20Space,
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
          child: DeclaraPage(),
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

  dateTimeTextField() {
    time = (time == '00:00')
        ? DateFormat.Hm().format(DateTime.now())
        : DateFormat.Hm().format(selectedDate);
    return InkWell(
      onTap: () => dateDialog(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Horario de Llamada',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              )),
          height20Space,
          TextField(
            enabled: false,
            controller: TextEditingController(
              text: '${DateFormat.yMMMd().format(selectedDate)} , $time',
            ),
            cursorColor: camposColor,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }

  dateDialog() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  customerTipoTextField() {
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
          hintText: 'Tipo de Trabajo',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerLugarTextField() {
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
          hintText: 'Lugar de Trabajo',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerAntigTextField() {
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
          hintText: 'Antigüedad',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
