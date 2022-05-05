import 'package:bankx/pages/screens.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'FormPartThree.dart';

class FormPartTwo extends StatefulWidget {
 /* final String loanType;
  final String number;
  final String dueAmount;
  final String emiAmount;
  FormPartTwo({required this.loanType, required this.number, required this.dueAmount, required this.emiAmount});*/
  @override
  _FormPartTwo createState() => _FormPartTwo();
}

class _FormPartTwo extends State<FormPartTwo> {
  late double height;
  String _value = 'Institución';
  int _value2 = 1;
  bool valuefirst = false;
  bool valuesecond = false;
  late String email, telefono, rfc, nss;
  final emailController = TextEditingController();
  final telController = TextEditingController();
  final rfcController = TextEditingController();
  final nssController = TextEditingController();
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
          'Solicitud de Crédito 2/3',
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
                height: 80,
                child: Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_fbyatqgb.json'),
              ),
              height20Space,
              customerEmailTextField(),
              height20Space,
              customerTelTextField(),
              height20Space,
              customerRfcTextField(),
              height20Space,
              customerssTextField(),
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
              email = emailController.text;
              telefono = telController.text;
              rfc = rfcController.text;
              nss = nssController.text;
              saveDataPref(email, telefono, rfc, nss);
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


  customerEmailTextField() {
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
        controller: emailController,
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        onEditingComplete:(){
          validateEmail(emailController.text);
        },
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'E-mail',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerTelTextField() {
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
        keyboardType: TextInputType.phone,
        controller: telController,
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        inputFormatters: [
          maskFormatterPhone
        ],
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Teléfono',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerRfcTextField() {
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
        textCapitalization: TextCapitalization.characters,
        controller: rfcController,
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        inputFormatters: [
          maskFormatterRFC
        ],
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'RFC',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerssTextField() {
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
        keyboardType: TextInputType.number,
        controller: nssController,
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        inputFormatters: [
          maskFormatterNss
        ],
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Número de Seguro Social',
          border: InputBorder.none,
        ),
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

  Future<void> saveDataPref(email, tel, rfc, nss) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('dataEmail', email);
    await preferences.setString('dataTelefono', tel);
    await preferences.setString('dataRfc', rfc);
    await preferences.setString('dataNss', nss);
  }

  Future<void> validateField() async {
    print('Usuario: ' + email);
    print('Pass: ' + nss);

    if (email.isEmpty || email == '' || email == null) {
      showMyDialogDanger("Se requiere E-mail.");
    } else if (telefono.isEmpty || telefono == '' || telefono == null) {
      showMyDialogDanger("Se requiere Télefono.");
    } else if (rfc.isEmpty || rfc == '' || rfc == null) {
      showMyDialogDanger("Se requiere RFC.");
    } else if (nss.isEmpty || nss == '' || nss == null) {
      showMyDialogDanger("Se requiere NSS.");
    } else {
      /*
      emailController.text = '';
      telController.text = '';
      rfcController.text = '';
      nssController.text = '';*/
      Navigator.push(context,
        PageTransition(duration: Duration(milliseconds: 500), type: PageTransitionType.rightToLeft,
          child: FormPartThree(),),);
    }
  }

  var maskFormatterPhone = new MaskTextInputFormatter(
      mask: '(###) ###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  var maskFormatterNss = new MaskTextInputFormatter(
      mask: '###########',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  var maskFormatterRFC = new MaskTextInputFormatter(
      mask: '%&%%######%?#',
      filter: { "#": RegExp(r'[0-9]'), "%": RegExp(r'[A-Z]'), "&": RegExp(r'[AEIOUX]'), "?": RegExp(r'[A-Z0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  void validateEmail(String val) {
    if(val.isEmpty){
      setState(() {
        showMyDialogDanger("Se requiere E-mail.");
      });
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        showMyDialogDanger("Correo invalido.");
      });
    }
  }

  Future<void> showMyDialogDanger(String msg) async {
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
              children: <Widget>[
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
}