import 'package:bankx/pages/screens.dart';
import 'package:lottie/lottie.dart';

import 'FirmaSolicitud.dart';

class FormPartThree extends StatefulWidget {
  final String loanType;
  final String number;
  final String dueAmount;
  final String emiAmount;

  FormPartThree({this.loanType, this.number, this.dueAmount, this.emiAmount});
  @override
  _FormPartThree createState() => _FormPartThree();
}

class _FormPartThree extends State<FormPartThree> {
  double height;
  String _value = 'Institución';
  int _value2 = 1;
  bool valuefirst = false;
  bool valuesecond = false;
  double value = 40000.0;
  double min = 2000;
  double max = 400000;
  double month = 20.0;
  double min_month = 10;
  double max_month = 60.0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Solicitud de Crédito 3/3',
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
                height: 80,
                child: Lottie.network(
                    'https://assets1.lottiefiles.com/packages/lf20_se2DT5.json'),
              ),
              height5Space,
              customerEdoDropdown(),
              height20Space,
              customerInstDropdown(),
              height20Space,
              customerCheck(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 300,
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
                              'Monto Solicitado',
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
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xFFF1F1F1), width: 2)),
                            ),
                            const Text(
                              'Tiempo a Pagar',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '${month.round()} Meses',
                              style: TextStyle(fontSize: 18),
                            ),
                            Slider(
                              value: month,
                              min: min_month,
                              max: max_month,
                              divisions: 5,
                              activeColor: Theme.of(context).primaryColor,
                              inactiveColor: Colors.orange,
                              onChanged: (double newValue) {
                                setState(() {
                                  month = newValue;
                                });
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '12 Meses',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  '60 Meses',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
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
                          Text(
                            'Tu monto mensual por ${month.round()} meses',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            '${value}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                                'Tú préstamo por ${value} en ${month.round()} meses al 13% de interes sería un monto apróximado total de: 5,56,073.'),
                          ),
                        ],
                      )),
                  countinueButton()
                ],
              ),
            ],
          ),
        ],
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
          child: FirmaSolicitud(),
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
          'Enviar Solicitud',
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
        /*
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),*/
        child: Row(children: [
          Checkbox(
            checkColor: Colors.orange,
            activeColor: Colors.green,
            value: this.valuefirst,
            onChanged: (bool value) {
              setState(() {
                this.valuefirst = value;
              });
            },
          ),
          Text('Acepto los términos y condiciones.',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              )),
        ]));
  }

  customerEdoDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding + 5.0,
        vertical: fixPadding - 6.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
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
          // value: _value,
          items: <String>[
            "Aguascalientes",
            "Baja California",
            "Baja California Sur",
            "Campeche",
            "CDMX",
            "Chiapas",
            "Chihuahua",
            "Coahuila",
            "Colima",
            "Durango",
            "Guanajuato",
            "Guerrero",
            "Hidalgo",
            "Jalisco",
            "Michoacán",
            "Morelos",
            "México",
            "Nayarit",
            "Nuevo León",
            "Oaxaca",
            "Puebla",
            "Querétaro",
            "Quintana Roo",
            "San Luis Potosí",
            "Sinaloa",
            "Sonora",
            "Tabasco",
            "Tamaulipas",
            "Tlaxcala",
            "Veracruz",
            "Yucatán",
            "Zacatecas"
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
          hint: Text("Selecciona un Estado")),
    );
  }

  customerInstDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding + 5.0,
        vertical: fixPadding - 6.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
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
          value: _value2,
          items: [
            DropdownMenuItem(
              child: Text("Físcalia General"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("IMSS"),
              value: 2,
            ),
            DropdownMenuItem(
              child: Text("ISSSTE"),
              value: 3,
            )
          ],
          onChanged: (int value) {
            setState(() {
              _value2 = value;
            });
          },
          hint: Text("Selecciona una Institución")),
    );
  }
}
