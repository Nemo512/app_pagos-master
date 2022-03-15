import 'dart:ui' as ui;
import 'package:bankx/pages/screens.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class FirmaSolicitud extends StatefulWidget {
  final String loanType;
  final String number;
  final String dueAmount;
  final String emiAmount;
  FirmaSolicitud({this.loanType, this.number, this.dueAmount, this.emiAmount});
  @override
  _FirmaSolicitud createState() => _FirmaSolicitud();
}

class _FirmaSolicitud extends State<FirmaSolicitud> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  double height;
  String _value = 'Institución';
  int _value2 = 1;
  bool valuefirst = false;
  bool valuesecond = false;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Solicitud de Crédito',
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
                  child: SfSignaturePad(
                      key: signatureGlobalKey,
                      backgroundColor: Colors.white,
                      strokeColor: Colors.black,
                      minimumStrokeWidth: 1.0,
                      maximumStrokeWidth: 4.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey))),
              SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[saveButton(), clearButton()]),
              height5Space,
              countinueButton()
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
          //child: FormPartThree(),
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
          'Enviar Solicitud',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }

  clearButton() {
    return InkWell(
      onTap: (_handleClearButtonPressed),
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
          'Limpiar',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }

  saveButton() {
    return InkWell(
      onTap: (_handleSaveButtonPressed),
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
          'Guardar',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState.clear();
  }

  void _handleSaveButtonPressed() async {
    final data = await signatureGlobalKey.currentState.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Container(
                color: Colors.grey[300],
                child: Image.memory(bytes.buffer.asUint8List()),
              ),
            ),
          );
        },
      ),
    );
  }
}
