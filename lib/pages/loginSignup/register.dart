import 'package:bankx/pages/screens.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              bankXWithImage(),
              height20Space,
              Text(
                'Registro',
                style: black14MediumTextStyle,
              ),
              height20Space,
              customerIdTextField(),
              height20Space,
              accountNumberTextField(),
              height20Space,
              mPinTextField(),
              height20Space,
              mPinTextField2(),
              height20Space,
              countinueButton(),
              height20Space,
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Text(
                  '¿Ya estás registrado?',
                  style: black16MediumTextStyle,
                ),
              ),
            ],
          ),
        ],
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
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: OTPCode(),
        ),
      ),
      child: Container(
        width: 110.0,
        height: 52.0,
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
          'Continuar',
          style: white14BoldTextStyle,
        ),
      ),
    );
  }

  customerIdTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 5.0),
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
          hintText: 'Nombre Completo',
          border: InputBorder.none,
        ),
      ),
    );
  }

  accountNumberTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 5.0),
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
          hintText: 'Número de teléfono',
          border: InputBorder.none,
        ),
      ),
    );
  }

  mPinTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 5.0),
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
          hintText: 'Contraseña',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

mPinTextField2() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: fixPadding * 5.0),
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
        hintText: 'Repetir Contraseña',
        border: InputBorder.none,
      ),
    ),
  );
}
