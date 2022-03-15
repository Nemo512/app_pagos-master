import 'dart:io';

import 'package:bankx/pages/screens.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'No autorizado';
  bool tooManyAttempt = false;
  bool _isFingerPrintBiometricAvailable;
  bool progress;
  bool cancelTapOnFingerprintDialog;
  DateTime currentBackPressTime;
  String user, pass, userPreference, passPreference;
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getPreferences();
  }

  fingerPrintAuth() async {
    await _checkBiometrics();
    if (!_canCheckBiometrics) {
      setState(() {
        _authorized = 'Sensor de Huella no disponible';
      });
    }

    if (_canCheckBiometrics) {
      await _getAvailableBiometrics();
      for (int i = 0; i < _availableBiometrics.length; i++) {
        if (_availableBiometrics[i] == BiometricType.fingerprint) {
          _isFingerPrintBiometricAvailable = true;
        }
      }

      if (!_isFingerPrintBiometricAvailable) {
        setState(() {
          _authorized = 'Sensor de Huella disponible.';
        });
      }

      if (_isFingerPrintBiometricAvailable) {
        await _authenticate();
      }
    }
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    String exceptionMsg;
    try {
      setState(() {
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Escanea tu huella para identificarte',
        useErrorDialogs: false,
        stickyAuth: true,
      );
      setState(() {
        _authorized = 'Autentificando';
      });
    } on PlatformException catch (e) {
      print(e);
      exceptionMsg = e.message;
    }
    if (!mounted) return;

    final String message = authenticated
        ? 'Autenticación por Huella Exitoso.'
        : (exceptionMsg != null)
            ? exceptionMsg
            : 'No autorizado';
    if (authenticated) {
      tooManyAttempt = false;
      Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: Register(),
        ),
      );
    }
    setState(() {
      _authorized = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                bankXWithImage(),
                height20Space,
                customerIdTextField(),
                height20Space,
                mPinTextField(),
                height20Space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    registerButton(),
                    countinueButton(),
                  ],
                ),
                height20Space,
                height20Space,
                Text(
                  'Escanea tu huella',
                  style: black14MediumTextStyle,
                ),
                height20Space,
                InkWell(
                  onTap: () => fingerPrintAuth(),
                  child: Icon(
                    Icons.fingerprint,
                    size: 68.0,
                    color: primaryColor,
                  ),
                ),
                height20Space,
                Text(
                  _authorized,
                  style: red14MediumTextStyle,
                ),
                height20Space,
                new Divider(
                  height: 3,
                  color: Colors.lightGreen,
                ),
                height20Space,
                Text(
                  'Ó conectate con:',
                  textAlign: TextAlign.center,
                  style: black14MediumTextStyle,
                ),
                otherOptions(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: fixPadding * 2.0,
                    left: fixPadding * 2.0,
                    right: fixPadding * 2.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bankXWithImage() {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        color: whiteColor,
        image: DecorationImage(
          image: AssetImage('assets/banking.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
      ),
    );
  }

  countinueButton() {
    return InkWell(
      onTap: () async {
        user = userController.text;
        pass = passController.text;
        savePreferences(user, pass);
        validateField();
      },
      child: Container(
        width: 110.0,
        height: 52.0,
        margin: EdgeInsets.symmetric(horizontal: fixPadding),
        padding: EdgeInsets.symmetric(
          vertical: fixPadding,
        ),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Text(
          ' Iniciar Sesión ',
          textAlign: TextAlign.center,
          style: white14BoldTextStyle,
        ),
      ),
    );
  }

  registerButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: Register(),
        ),
      ),
      child: Container(
        width: 110.0,
        height: 52.0,
        margin: EdgeInsets.symmetric(horizontal: fixPadding),
        padding: EdgeInsets.symmetric(
          vertical: fixPadding,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: orangeColor,
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Text(
          '¿Nuevo Usuario?',
          textAlign: TextAlign.center,
          style: white14BoldTextStyle,
        ),
      ),
    );
  }

  Future<void> validateField() {
    print('Usuario: ' + user);
    print('Pass: ' + pass);

    if (user.isEmpty || user == '' || user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Usuario invalido")));
    } else if (pass.isEmpty || pass == '' || pass == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Contraseña invalida")));
    } else {
      userController.text = '';
      passController.text = '';
      Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 0),
          type: PageTransitionType.rightToLeft,
          child: BottomBar(),
        ),
      );
    }
  }

  Future<void> savePreferences(user, pass) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('user', user);
    await preferences.setString('pass', pass);
    //  print(user);
  }

  Future<void> getPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userPreference = await preferences.getString('user');
    passPreference = await preferences.getString('pass');
    //print('usuario preferences: '+userPreference);

    if (passPreference != '') {
      if (passPreference != null) {
        Navigator.push(
          context,
          PageTransition(
            duration: Duration(milliseconds: 0),
            //type: PageTransitionType.rightToLeft,
            child: BottomBar(),
          ),
        );
      }
    }
  }

  customerIdTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 6.0),
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding + 5.0,
        vertical: fixPadding - 6.0,
      ),
      decoration: BoxDecoration(
        color: camposColor,
        boxShadow: [],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        controller: userController,
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.account_circle,
            size: 40,
            color: Colors.orange,
          ),
          hintStyle: black14MediumTextStyle,
          hintText: 'Nombre de Usuario',
          border: InputBorder.none,
        ),
      ),
    );
  }

  mPinTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 6.0),
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding + 4.0,
        vertical: fixPadding - 5.0,
      ),
      decoration: BoxDecoration(
        color: camposColor,
        boxShadow: [BoxShadow()],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        controller: passController,
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.lock_rounded,
            size: 40,
            color: Colors.orange,
          ),
          hintStyle: black14MediumTextStyle,
          hintText: 'Escribir Contraseña',
          border: InputBorder.none,
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Presiona de Nuevo para Salir.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  otherOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45.0,
              padding: EdgeInsets.all(fixPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xfffffff),
                boxShadow: [],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/fbl.png',
                    height: 35.0,
                    width: 35.0,
                  ),
                  widthSpace,
                  Text(
                    'Facebook',
                    style: blue16BoldTextStyle,
                  ),
                ],
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          widthSpace,
          Expanded(
            child: Container(
              height: 45.0,
              padding: EdgeInsets.all(fixPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xfffffff),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/gl.png',
                    height: 35.0,
                    width: 35.0,
                  ),
                  widthSpace,
                  widthSpace,
                  Text(
                    'Gmail',
                    style: red16BoldTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
