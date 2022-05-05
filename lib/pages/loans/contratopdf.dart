import 'dart:io';
import 'package:bankx/pages/loans/api_service.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:bankx/pages/loans/pago.dart';
import 'package:flutter/material.dart';
import 'package:bankx/pages/screens.dart';

class ContratopdfPage extends StatefulWidget {
  static const String routeName = '/contratopdf';

  @override
  _ContratopdfPageState createState() => _ContratopdfPageState();
}

class _ContratopdfPageState extends State<ContratopdfPage> {
  String _localFile = "";

  @override
  void initState() {
    super.initState();
    ApiService.loadPDF().then((value) {
      setState(() {
        _localFile = value;
        print(_localFile);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Contrato',
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
      body: _localFile != null
          ? Container(
              child: PDFView(
                filePath: _localFile,
              ),
            )
          : CircularProgressIndicator(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PagoPage()),
          );
          // Add your onPressed code here!
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.navigate_next_sharp),
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
          child: PagoPage(),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        padding: EdgeInsets.symmetric(
          vertical: fixPadding + 4.0,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: orangeColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          'SI',
          style: black18BoldTextStyle,
        ),
      ),
    );
  }
}
