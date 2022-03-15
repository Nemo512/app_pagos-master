import 'dart:async';

import 'package:animated/animated.dart';
import 'package:bankx/pages/screens.dart';
import 'package:lottie/lottie.dart';

import '../loans/photoPrueba.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool scaled = false;
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 80),
      () => setState(() {
        scaled = true;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF1F3),
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text('Selecciona tú Sector'),
        toolbarHeight: 80, // default is 56
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 350,
              child: Lottie.network(
                  'https://assets4.lottiefiles.com/packages/lf20_s37ywevl.json'),
            ),
            height5Space,
            Container(
              height: 300,
              child: ListView(
                children: [
                  Column(
                    children: [
                      cardSector(
                        titleSector: 'Sector Educativo',
                        imageSector: 'assets/edu.png',
                      ),
                      cardSector(
                        titleSector: 'Sector Médico',
                        imageSector: 'assets/med.png',
                      ),
                      cardSector(
                        titleSector: 'Sector Gobierno',
                        imageSector: 'assets/gober.png',
                      ),
                      cardSector(
                        titleSector: 'Pensionados',
                        imageSector: 'assets/pens.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  cardSector({titleSector, imageSector}) {
    return Animated(
      value: scaled ? 1 : 0.5,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      builder: (context, child, animation) => Transform.scale(
        scale: animation.value,
        child: child,
      ),
      child: Container(
          margin: EdgeInsets.only(
            top: fixPadding * 1.0,
            left: fixPadding * 4.5,
            right: fixPadding * 3.0,
          ),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(fixPadding),
            color: Colors.white,
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Loans()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titleSector,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                width20Space,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imageSector,
                      height: 100,
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
