import 'package:bankx/pages/loans/solformtre.dart';
import 'package:bankx/pages/loans/solformtwo.dart';
import 'package:flutter/material.dart';
import 'package:bankx/pages/screens.dart';

class SolformonePage extends StatefulWidget {
  static const String routeName = '/solformone';

  @override
  _SolformonePageState createState() => _SolformonePageState();
}

class _SolformonePageState extends State<SolformonePage> {
  String _value = 'Genero';
  String _value2 = "Estado civil";
  String _value3 = "Residencia";
  String _value4 = "Escolaridad";
  double value = 40000.0;
  double min = 2000;
  double max = 400000;
  bool valuefirst = false;
  bool btnDiasble = true;
  double opacity = 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),
              height5Space,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(color: Color(0xFFF1F1F1), width: 1)),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Descuento de Nómina',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '${value}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Slider(
                              value: value,
                              min: min,
                              max: max,
                              divisions: 10,
                              activeColor: Theme.of(context).primaryColor,
                              inactiveColor: Colors.orange,
                              onChanged: (double newValue) {
                                setState(() {
                                  value = newValue;
                                });
                              },
                            ),
                            height5Space,
                          ],
                        ),
                      ),
                      GeneroDropdown(),
                      height20Space,
                      EdocivilDropdown(),
                      height20Space,
                      ResiDropdown(),
                      height20Space,
                      EscoDropdown(),
                      height20Space,
                      customerCheck(),
                      height20Space,
                      countinueButton()
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  GeneroDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 49.0,
      ),
      decoration: BoxDecoration(
        color: camposColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: primaryColor.withOpacity(0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton(
          // value: _value,
          items: <String>[
            "Masculino",
            "Femenino",
            "Otro",
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String ? value) {
            setState(() {
              _value = value as String;
            });
          },
          hint: Text("Género")),
    );
  }

  EdocivilDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 45.0,
      ),
      decoration: BoxDecoration(
        color: camposColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: primaryColor.withOpacity(0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton(
          // value: _value,
          items: <String>[
            "Soltero",
            "Casado",
            "Divorciado",
            "Víudo",
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String ? value) {
            setState(() {
              _value2 = value as String;
            });
          },
          hint: Text("Estado Civil")),
    );
  }

  ResiDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      decoration: BoxDecoration(
        color: camposColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: primaryColor.withOpacity(0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton(
          // value: _value,
          items: <String>[
            "Casa Propia",
            "Casa Renta",
            "Departamento Propio",
            "Departamento Renta",
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String ? value) {
            setState(() {
              _value3 = value as String;
            });
          },
          hint: Text("Tipo de Residencia")),
    );
  }

  EscoDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      decoration: BoxDecoration(
        color: camposColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: primaryColor.withOpacity(0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton(
          // value: _value,
          items: <String>[
            "Básica",
            "Media/Bachillerato",
            "Superior",
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String ? value) {
            setState(() {
              _value4 = value as String;
            });
          },
          hint: Text("Escolaridad")),
    );
  }

  countinueButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: SolformtwoPage(),
          //child: SolformtrePage(),
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
}
