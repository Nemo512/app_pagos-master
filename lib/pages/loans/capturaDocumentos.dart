import 'dart:convert';
import 'dart:ui' as ui;
import 'package:bankx/pages/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/Solicitud.dart';
import 'Esperandorespuesta.dart';
import 'package:http/http.dart' as http;

class CapturaDocuments extends StatefulWidget {

  CapturaDocuments();
  @override
  _CapturaDocuments createState() => _CapturaDocuments();
}

class _CapturaDocuments extends State<CapturaDocuments> {
  List<Solicitud> solicitud= [];
 late  double height;
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
            color: whiteColor,
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
                imageChange(),
                height20Space,
                imageChangerev(),
                height20Space,
                imageChangecomp(),
                height20Space,
                imageChangetalon(),
                height20Space,
                countinueButton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  imageChange() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 160.0,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            width: width - fixPadding * 4.0,
            alignment: Alignment.center,
            child: Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/user/inef.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: width - fixPadding * 4.0,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => chooseOptionBottomSheet(),
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 140.0,
                  padding: EdgeInsets.symmetric(vertical: fixPadding * 0.6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    border: Border.all(
                      width: 2.0,
                      color: primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 16.0,
                        color: orangeColor,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'INE frontal',
                        style: white12MediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  imageChangerev() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 160.0,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            width: width - fixPadding * 4.0,
            alignment: Alignment.center,
            child: Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/user/reverso.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: width - fixPadding * 4.0,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => chooseOptionBottomSheet(),
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 140.0,
                  padding: EdgeInsets.symmetric(vertical: fixPadding * 0.6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    border: Border.all(
                      width: 2.0,
                      color: primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 16.0,
                        color: orangeColor,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'INE reverso',
                        style: white12MediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  imageChangecomp() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 160.0,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            width: width - fixPadding * 4.0,
            alignment: Alignment.center,
            child: Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/user/domicilio.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: width - fixPadding * 4.0,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => chooseOptionBottomSheet(),
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 140.0,
                  padding: EdgeInsets.symmetric(vertical: fixPadding * 0.6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    border: Border.all(
                      width: 2.0,
                      color: primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 16.0,
                        color: orangeColor,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Comprobante',
                        style: white12MediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  imageChangetalon() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 160.0,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            width: width - fixPadding * 4.0,
            alignment: Alignment.center,
            child: Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/user/talon.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: width - fixPadding * 4.0,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => chooseOptionBottomSheet(),
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 140.0,
                  padding: EdgeInsets.symmetric(vertical: fixPadding * 0.6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    border: Border.all(
                      width: 2.0,
                      color: primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 16.0,
                        color: orangeColor,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Talón de Pago',
                        style: white12MediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  chooseOptionBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: fixPadding,
            horizontal: fixPadding + 5.0,
          ),
          child: Wrap(
            children: [
              Column(
                children: [
                  Center(
                    child: Text(
                      'Elige una opción',
                      style: black16BoldTextStyle,
                    ),
                  ),
                  heightSpace,
                  Container(
                    height: 1.0,
                    color: greyColor,
                  ),
                  heightSpace,
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: chooseFromCameraOrGallery(
                      icon: Icons.camera_alt,
                      optionText: 'Cámara',
                    ),
                  ),
                  heightSpace,
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: chooseFromCameraOrGallery(
                      icon: Icons.photo_album,
                      optionText: 'Subir desde Galería',
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  chooseFromCameraOrGallery({icon, optionText}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20.0,
          color: orangeColor,
        ),
        width5Space,
        Text(
          optionText,
          style: black14MediumTextStyle,
        ),
      ],
    );
  }

  countinueButton() {
    return InkWell(
      onTap: ()
    {
      getPreferences();
      },
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


 Future<void> getPreferences() async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   print('Data preferences: '+ await preferences.getString('dataNombre').toString());
   print('Data preferences: '+ await preferences.getString('dataApellidoP').toString());
   print('Data preferences: '+ await preferences.getString('dataApellidoM').toString());
   print('Data preferences: '+ await preferences.getString('dataCurp').toString());
   print('Data preferences: '+ await preferences.getString('dataEmail').toString());
   print('Data preferences: '+ await preferences.getString('dataTelefono').toString());
   print('Data preferences: '+ await preferences.getString('dataRfc').toString());
   print('Data preferences: '+ await preferences.getString('dataNss').toString());
   print('Data preferences: '+ await preferences.getString('dataEstado').toString());
   print('Data preferences: '+ await preferences.getString('dataFisGral').toString());
   print('Data preferences: '+ await preferences.getString('dataMonto').toString());
   print('Data preferences: '+ await preferences.getString('dataTiempoP').toString());
   print('Data preferences: '+ await preferences.getString('dataSector').toString());

   solicitud.add(
       Solicitud(
           await preferences.getString('dataNombre').toString(),
           await preferences.getString('dataApellidoP').toString(),
           await preferences.getString('dataApellidoM').toString(),
           await preferences.getString('dataCurp').toString(),
           await preferences.getString('dataRfc').toString(),
           await preferences.getString('dataEmail').toString(),
           await preferences.getString('dataTelefono').toString(),
           await preferences.getString('dataNss').toString(),
           await preferences.getString('dataEstado').toString(),
           await preferences.getString('dataFisGral').toString(),
           await preferences.getString('dataMonto').toString(),
           await preferences.getString('dataTiempoP').toString(),
           await preferences.getString('dataSector').toString())
   );
   insertCliente();
 }

 Future<void> insertCliente() async{
   print("Entrando al metodo insertCliente ");
   var url = "https://24ijin89wg.execute-api.us-east-1.amazonaws.com/postCliente";

   Map data = {
     "nombre": solicitud[0].nombre,
     "apellidoP": solicitud[0].apellidoPaterno,
     "apellidoM": solicitud[0].apellidoMaterno,
     "curp": solicitud[0].curp,
     "rfc": solicitud[0].rfc,
     "nss": solicitud[0].nss,
     "email": solicitud[0].email,
     "telefono": solicitud[0].telefono,
     "estado": solicitud[0].estado,
     "fisGral": solicitud[0].fiscalGral,
     "monto": solicitud[0].monto,
     "tiempoP": solicitud[0].mes,
     "sector": solicitud[0].sector
   };

   var body = json.encode(data);
   var response = await http.post(Uri.parse(url),
       headers: {"Content-Type": "application/json"},
       body: body
   );
   if(response.statusCode == 200){
     print(response.body);
     insertPreSolicitud();
   }else{
     throw Exception("Error en ClientePost--> "+ response.body);
   }
 }

  Future<void> insertPreSolicitud() async{
    print("Entrando al metodo insertPreSolicitud ");
    var url = "https://wsa1hyq844.execute-api.us-east-1.amazonaws.com/postPreSolicitud";

    Map data = {
      "monto": solicitud[0].monto,
      "tiempoP": solicitud[0].mes,
    };

    var body = json.encode(data);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: body
    );

    if(response.statusCode == 200){
      solicitud.clear();
      print(response.body);
      Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: Esperandorespuesta(),
        ),
      );
    }else{
      throw Exception("Error en PresolicitudPost--> "+ response.body);
    }
  }
}
