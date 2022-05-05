import 'dart:convert';

import 'package:bankx/pages/screens.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'FormPartTwo.dart';
import 'package:http/http.dart' as http;

class FormPartOne extends StatefulWidget {
  final String loanType;
  final String number;
  final String dueAmount;
  final String emiAmount;
  FormPartOne({required this.loanType, required this.number, required this.dueAmount, required this.emiAmount});
  @override
  _FormPartOne createState() => _FormPartOne();
}

class _FormPartOne extends State<FormPartOne> {
  late double height;
  String _value = 'Institución';
  int _value2 = 1;
  bool valuefirst = false;
  bool valuesecond = false;
  late String name, apellidoP, apellidoM, curp;
  final nameController = TextEditingController();
  final apellidoPController = TextEditingController();
  final apellidoMController = TextEditingController();
  final curpController = TextEditingController();
  bool? aceptarInfo = false;
  bool? visiCamp;
  bool btnDiasble = true;
  double opacity = 0.2;

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
          'Solicitud de Crédito 1/3',
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              heightSpace,
              Container(
                height: 80,
                child: Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_iu7zyxfk.json'),
              ),
              height20Space,
              customercurpTextField(),
              height20Space,
              customerNameTextField(),
              height20Space,
              customerApaternoTextField(),
              height20Space,
              customerAmaternoTextField(),
              height20Space,
              customerCheck(),
              height20Space,
             countinueButton(),
            ],
          ),
        ],
      ),
    );
  }

  countinueButton() {
    return AbsorbPointer(
      absorbing: btnDiasble,
      child:
        Opacity(
          opacity: opacity,
          child:       InkWell(
            onTap: () async{
              name = nameController.text;
              apellidoP = apellidoPController.text;
              apellidoM = apellidoMController.text;
              curp = curpController.text;
              saveDataPref(name, apellidoP, apellidoM, curp);
              validateField();
            },
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
          ),
        )
    );
  }

  customerNameTextField() {
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
        enabled: false,
        controller: nameController,
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Nombre(s)',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerAmaternoTextField() {
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
        enabled: false,
        controller: apellidoMController,
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Apellido Materno',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerApaternoTextField() {
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
        enabled: false,
        textCapitalization: TextCapitalization.sentences,
        controller: apellidoPController,
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Apellido Paterno',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customercurpTextField() {
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
        controller: curpController,
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        textCapitalization: TextCapitalization.characters,
        inputFormatters: [
          maskFormatterCurp
        ],
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'CURP',
          border: InputBorder.none,
        ),
        onEditingComplete:(){
          getDataCurp(curpController.text);
        },
      ),
    );
  }

  customerCheck() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        padding: EdgeInsets.symmetric(
          horizontal: fixPadding + 5.0,
          vertical: fixPadding - 6.0,
        ),
        child: Row(children: [
          Checkbox(
            checkColor: Colors.white,
            activeColor: primaryColor,
            value: this.valuefirst,
            onChanged: (bool ? value) {
              setState(() {
                this.valuefirst = value as bool;
                if(value == true){
                  btnDiasble = false;
                  opacity = 1.0;
                }else{
                  btnDiasble = true;
                  opacity = 0.2;
                }
              });
            },
          ),
          Text('Acepto qué la información es la correcta',
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.black,
              )),
        ]));
  }

  Future<void> saveDataPref(name, apellidoP, apellidoM, curp) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('dataNombre', name);
    await preferences.setString('dataApellidoP', apellidoP);
    await preferences.setString('dataApellidoM', apellidoM);
    await preferences.setString('dataCurp', curp);
  }

  Future<void> validateField() async {
    print('Usuario: ' + name);
    print('Pass: ' + curp);

   if (curp.isEmpty || curp == '' || curp == null) {
     showMyDialogDangerVacio();
    } else {
      /*
      nameController.text = '';
      apellidoPController.text = '';
      apellidoMController.text = '';
      curpController.text = '';*/
      Navigator.push(context,
        PageTransition(duration: Duration(milliseconds: 500), type: PageTransitionType.rightToLeft,
          child: FormPartTwo(),),);
    }
  }


  Future<void> getDataCurp(String curp) async{
    print("Entrando al metodo insertCliente ");
    String token = "a00becf8-2bca-4fc2-a626-14eec499b988";
    var url = "https://api.valida-curp.com.mx/curp/obtener_datos?curp="+curp+"&token="+token;

    var response = await http.get(Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );
    String body  = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);

    if(response.statusCode == 200){
      nameController.text = jsonData["response"]["Solicitante"]["Nombres"];
      apellidoPController.text = jsonData["response"]["Solicitante"]["ApellidoPaterno"];
      apellidoMController.text = jsonData["response"]["Solicitante"]["ApellidoMaterno"];
      print(jsonData["response"]["Solicitante"]["Nombres"]);
      print(jsonData["response"]["Solicitante"]["ApellidoPaterno"]);
      print(jsonData["response"]["Solicitante"]["ApellidoMaterno"]);
    }else{
      String code = jsonData["error_message"];
      showMyDialogDanger(code);
      /*
      String code = jsonData["error_message"];
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(code)));
      throw Exception("Error en getStatusPreSolicitud--> "+ response.body);*/
    }
  }



  var maskFormatterCurp = new MaskTextInputFormatter(
      mask: '%&%%######%%%%%%##',
      filter: { "#": RegExp(r'[0-9]'), "%": RegExp(r'[A-Z]'), "&": RegExp(r'[AEIOUX]') },
      type: MaskAutoCompletionType.lazy
  );


  Future<void> showMyDialogDanger(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Problemas al obtener el CURP.',
            style: TextStyle(
              fontFamily: 'Fredoka',
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text(
                  msg,
                  style: TextStyle(
                    fontFamily: 'Fredoka',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Aceptar',
                style: TextStyle(
                  fontFamily: 'Fredoka',
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showMyDialogDangerVacio() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Introduce los datos requeridos',
            style: TextStyle(
              fontFamily: 'Fredoka',
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'Asegurate de llenar el formulario requerido',
                  style: TextStyle(
                    fontFamily: 'Fredoka',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Aceptar',
                style: TextStyle(
                  fontFamily: 'Fredoka',
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
