import 'package:bankx/pages/loans/solformtre.dart';
import 'package:flutter/material.dart';
import 'package:bankx/pages/screens.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../../servicesIq/codigo_p_externo.dart';

class SolformtwoPage extends StatefulWidget {
  static const String routeName = '/solformtwo';

  @override
  _SolformtwoPageState createState() => _SolformtwoPageState();
}

class _SolformtwoPageState extends State<SolformtwoPage> {
  TextEditingController controladorCodigoPostal = TextEditingController();
  TextEditingController controladorEstado = TextEditingController();
  TextEditingController controladorMunicipio = TextEditingController();
  TextEditingController controladorCity = TextEditingController();
  TextEditingController controladorColony = TextEditingController();
  TextEditingController _controller = TextEditingController();
  final fromKeySE = GlobalKey<FormState>();
  String selectedValue = '';
  bool clear = false;
  bool? aceptarInfo = false;
  bool? visiCamp;
  final serviceCodigoPostal = CodigoPostalExterno();
  List<String> itemsColonia = ["Selecciona una Colonia"];
  bool valuefirst = false;
  bool btnDiasble = true;
  double opacity = 0.2;
  String colValue = 'Selecciona una Colonia';

  void initState() {
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Selecciona tú dirección',
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
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              children: [
                const Text(
                  'Ingresa el código postal para buscar los siguientes datos ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                height20Space,
                // Codigo postal
                customerCPField(),
                Form(
                  key: fromKeySE,
                  child: Column(
                    children: [
                      Visibility(
                        visible: visiCamp != false ? true : false,
                        child: Column(
                          children: [
                            height20Space,
                            customerEdoField(),
                            height20Space,
                            customerMunicipioField(),
                            height20Space,
                            customerCiudadField(),
                            height20Space,
                            customerInstDropdown(),
                          ],
                        ),
                      ),
                      height20Space,
                      customerCheck(),
                      height20Space,
                      countinueButton(),
                      /*
                                    GestureDetector(
                                        onTap: () {
                                          if (fromKeySE.currentState!
                                              .validate()) {
                                            if (aceptarInfo != false) {
                                              saveDatosFormDomicilio();

                                              CoolAlert.show(
                                                  lottieAsset:
                                                  'assets/images/warning.json',
                                                  backgroundColor: Colors.white,
                                                  context: context,
                                                  type: CoolAlertType.warning,
                                                  text:
                                                  '¿Estás seguro de qué la información es correcta?',
                                                  confirmBtnText: 'Ok',
                                                  onConfirmBtnTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              TipoContratoPage()),
                                                    );
                                                  });
                                            } else {
                                              CoolAlert.show(
                                                  lottieAsset:
                                                  'assets/images/warning.json',
                                                  backgroundColor: Colors.white,
                                                  context: context,
                                                  type: CoolAlertType.warning,
                                                  text:
                                                  'Debes aceptar que la información es correcta, marca la casilla',
                                                  confirmBtnText: 'Ok',
                                                  onConfirmBtnTap: () {
                                                    Navigator.pop(context);
                                                  });
                                            }
                                          }
                                        },
                                        child: Lottie.asset(
                                            'assets/images/siguiente.json',
                                            height: 60,
                                            width: 60)),

                                    */
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  customerCPField() {
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
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Código Postal',
          hintStyle: black14MediumTextStyle,
          border: InputBorder.none,
        ),
        onEditingComplete: () {
          Future.delayed(const Duration(seconds: 0), () {
            serviceCodigoPostal
                .getCodigoPostal(controladorCodigoPostal.text)
                .then((value) {
              setState(() {
                controladorEstado.text = value['response']['estado'];
                controladorMunicipio.text = value['response']['municipio'];
                controladorCity.text = value['response']['ciudad'];

                itemsColonia.clear();
                itemsColonia = ["Selecciona una Colonia"];
                for (var item in value['response']['asentamiento']) {
                  itemsColonia.add(item.toString());
                }
                // itemsColonia =["Selecciona una Colonia", value['response']
                //  ['asentamiento'].toString()];
              });
            });
          });
        },
        controller: controladorCodigoPostal,
      ),
    );
  }

  customerEdoField() {
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
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Estado',
          hintStyle: black14MediumTextStyle,
          border: InputBorder.none,
        ),
        controller: controladorEstado,
      ),
    );
  }

  customerMunicipioField() {
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
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Municipio',
          hintStyle: black14MediumTextStyle,
          border: InputBorder.none,
        ),
        controller: controladorMunicipio,
      ),
    );
  }

  customerCiudadField() {
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
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Ciudad',
          hintStyle: black14MediumTextStyle,
          border: InputBorder.none,
        ),
        controller: controladorCity,
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
          child: SolformtrePage(),
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
            onChanged: (bool? value) {
              setState(() {
                this.valuefirst = value as bool;
                if (value == true) {
                  btnDiasble = false;
                  opacity = 1.0;
                } else {
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

  customerInstDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 4.0),
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
      child: DropdownButton(
          value: colValue,
          /*
          items: <String>[
            "Selecciona una Institución",
            "Físcalia General",
            "IMSS",
            "ISSSTE"
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),*/
          items: itemsColonia
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (String? value) {
            setState(() {
              colValue = value as String;
            });
          },
          hint: Text("Selecciona una Institución")),
    );
  }

  saveDatosFormDomicilio() async {
    //dividir el nombre

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('control_codigoPostal', controladorCodigoPostal.text);
    prefs.setString('control_estado', controladorEstado.text);
    prefs.setString('control_municipio', controladorMunicipio.text);
    prefs.setString('control_ciudad', controladorCity.text);
    prefs.setString('control_colonia', controladorColony.text);
  }
}
