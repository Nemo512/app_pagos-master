import 'package:bankx/pages/screens.dart';

class LoanStatement extends StatefulWidget {
  final String loanType;
  final String number;
  final String dueAmount;
  final String emiAmount;
  LoanStatement({this.loanType, this.number, this.dueAmount, this.emiAmount});
  @override
  _LoanStatementState createState() => _LoanStatementState();
}

class _LoanStatementState extends State<LoanStatement> {
  double height;
  String _value = 'Institución';
  int _value2 = 1;
  bool valuefirst = false;
  bool valuesecond = false;
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: fixPadding * 2.0,
              vertical: fixPadding * 2.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpace,
                height5Space,
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Nombre:',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFDE9792F),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFDE9792F),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Apellido Paterno:',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFDE9792F),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFDE9792F),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Apellido Materno:',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFDE9792F),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFDE9792F),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'E-MAIL:',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFDE9792F),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFDE9792F),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Teléfono:',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFDE9792F),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFDE9792F),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'RFC:',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFDE9792F),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFDE9792F),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Estado: ',
                  style: TextStyle(fontSize: 15.0),
                ),
                DropdownButton(
                    //OPCION DE ESTADO
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text("Morelos"),
                        value: 'Institución',
                      ),
                      DropdownMenuItem(
                        child: Text("CDMX"),
                        value: 'Institución 2',
                      ),
                      DropdownMenuItem(
                        child: Text("Puebla"),
                        value: 'Institución 3',
                      )
                    ],
                    onChanged: (String value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    hint: Text("Selecciona un Estado")),
                //OPCIÓN DE INSTITUCIÓN
                Text(
                  'Institución: ',
                  style: TextStyle(fontSize: 15.0),
                ),
                DropdownButton(
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
                Text(
                  'Acepto los términos y condiciones: ',
                  style: TextStyle(fontSize: 15.0),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                  },
                  child: const Text('Envíar Solicitud'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
