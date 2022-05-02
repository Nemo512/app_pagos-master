import 'dart:ui' as ui;
import 'dart:async';
import 'package:bankx/pages/loans/aprobado.dart';
import 'package:bankx/pages/screens.dart';
import 'package:lottie/lottie.dart';

class Esperandorespuesta extends StatefulWidget {
  @override
  _Esperandorespuesta createState() => _Esperandorespuesta();
}

class _Esperandorespuesta extends State<Esperandorespuesta> {
  @override
  void initState() {
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AprobadoPage()));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Esperando Respuesta',
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
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.network(
                    'https://assets2.lottiefiles.com/packages/lf20_txpagpud.json'),
                height20Space,
                Text('Envíando Información',
                    style: TextStyle(
                      fontSize: 19.0,
                      color: Colors.black,
                    )),
                Text('Nuestros Expertos están evaluando tú préstamo',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
