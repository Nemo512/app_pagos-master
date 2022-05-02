import 'package:bankx/pages/loans/solformtwo.dart';
import 'package:flutter/material.dart';
import 'package:bankx/pages/screens.dart';

class SolformonePage extends StatefulWidget {
  static const String routeName = '/solformone';

  @override
  _SolformonePageState createState() => _SolformonePageState();
}

class _SolformonePageState extends State<SolformonePage> {
  String _value = 'Institución';
  double value = 40000.0;
  double min = 2000;
  double max = 400000;
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
          onChanged: (String value) {
            setState(() {
              _value = value;
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
          onChanged: (String value) {
            setState(() {
              _value = value;
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
          onChanged: (String value) {
            setState(() {
              _value = value;
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
          onChanged: (String value) {
            setState(() {
              _value = value;
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
}
