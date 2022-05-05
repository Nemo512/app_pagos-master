import 'dart:async';
import 'package:bankx/pages/screens.dart';

class OTPCode extends StatefulWidget {
  @override
  _OTPCodeState createState() => _OTPCodeState();
}

class _OTPCodeState extends State<OTPCode> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController forthController = TextEditingController();

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode forthFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bankXWithImage(),
              height20Space,
              enterOTPHint(),
              height20Space,
              otpCode(),
              height20Space,
              countinueButton(),
              height20Space,
              resendText(),
            ],
          ),
        ],
      ),
    );
  }

  enterOTPHint() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 3.7),
      child: Text(
        'Escribe el código envíado a tu celular',
        textAlign: TextAlign.center,
        style: black14MediumTextStyle,
      ),
    );
  }

  resendText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 3.0),
      child: Row(
        children: [
          Text(
            'No recibí mi código ',
            textAlign: TextAlign.center,
            style: grey14MediumTextStyle,
          ),
          Text(
            'Reenvíar',
            textAlign: TextAlign.center,
            style: black18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  otpCode() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          firstDigit(),
          secondDigit(),
          thirdDigit(),
          forthDigit(),
        ],
      ),
    );
  }

  firstDigit() {
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        color: camposColor,
        borderRadius: BorderRadius.circular(fixPadding),
        boxShadow: [],
      ),
      child: TextField(
        style: black16BoldTextStyle,
        maxLength: 1,
     //   buildCounter: Widget as bool ? (BuildContext context,
               // {required int currentLength, required int maxLength, required bool isFocused}) => null  ,
        controller: firstController,
        focusNode: firstFocusNode,
        keyboardType: TextInputType.number,
        cursorColor: primaryColor,
        textAlign: TextAlign.center,
        onChanged: (v) {
          String value = firstController.text;
          if (value.isNotEmpty) {
            FocusScope.of(context).requestFocus(secondFocusNode);
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(fixPadding + 5.0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  secondDigit() {
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        color: camposColor,
        borderRadius: BorderRadius.circular(fixPadding),
        boxShadow: [],
      ),
      child: TextField(
        style: black16BoldTextStyle,
        maxLength: 1,
      //  buildCounter: (BuildContext context,
       //         {int currentLength, bool isFocused, int maxLength}) =>
        //    null,
        controller: secondController,
        focusNode: secondFocusNode,
        keyboardType: TextInputType.number,
        cursorColor: primaryColor,
        textAlign: TextAlign.center,
        onChanged: (v) {
          String value = secondController.text;
          if (value.isEmpty) {
            FocusScope.of(context).requestFocus(firstFocusNode);
            return;
          }
          FocusScope.of(context).requestFocus(thirdFocusNode);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(fixPadding + 5.0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  thirdDigit() {
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        color: camposColor,
        borderRadius: BorderRadius.circular(fixPadding),
        boxShadow: [],
      ),
      child: TextField(
        style: black16BoldTextStyle,
        maxLength: 1,
       // buildCounter: (BuildContext context,
        //        {int currentLength, int maxLength, bool isFocused}) =>
        //    null,
        controller: thirdController,
        focusNode: thirdFocusNode,
        keyboardType: TextInputType.number,
        cursorColor: primaryColor,
        textAlign: TextAlign.center,
        onChanged: (v) {
          String value = thirdController.text;
          if (value.isEmpty) {
            FocusScope.of(context).requestFocus(secondFocusNode);
            return;
          }
          FocusScope.of(context).requestFocus(forthFocusNode);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(fixPadding + 5.0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  forthDigit() {
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        color: camposColor,
        borderRadius: BorderRadius.circular(fixPadding),
        boxShadow: [],
      ),
      child: TextField(
        style: black16BoldTextStyle,
        maxLength: 1,
     //   buildCounter: (BuildContext context,
        //        {int currentLength, int maxLength, bool isFocused}) =>
        //    null,
        controller: forthController,
        focusNode: forthFocusNode,
        keyboardType: TextInputType.number,
        cursorColor: primaryColor,
        textAlign: TextAlign.center,
        onChanged: (v) {
          String value = forthController.text;
          if (value.isEmpty) {
            FocusScope.of(context).requestFocus(thirdFocusNode);
            return;
          } else {
            showProgress();
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(fixPadding + 5.0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  bankXWithImage() {
    return Stack(
      children: [
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            color: blackColor,
            image: DecorationImage(
              image: AssetImage('assets/banking.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              '',
              style: white36BoldTextStyle,
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          left: 10.0,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            iconSize: 24.0,
            color: whiteColor,
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
      ],
    );
  }

  countinueButton() {
    return InkWell(
      onTap: () => showProgress(),
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
          'Continuar',
          style: white14BoldTextStyle,
        ),
      ),
    );
  }

  showProgress() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(fixPadding),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: fixPadding * 2.0),
            child: Wrap(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(primaryColor),
                          strokeWidth: 3.0,
                        ),
                        width: 45.0,
                        height: 45.0,
                      ),
                      height20Space,
                      heightSpace,
                      Text(
                        'Por favor espera..',
                        style: grey12MediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomBar(),
        ),
      ),
    );
  }
}
