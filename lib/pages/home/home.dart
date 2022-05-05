import 'dart:async';
import 'dart:convert';

import 'package:animated/animated.dart';
import 'package:bankx/pages/screens.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/Sector.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool scaled = false;

  Future<List<Sector>>?  _listSector;
  Future<List<Sector>> _getSector() async{
    List<Sector> sectores = [];
    final response = await http.get(Uri.parse("https://zqk6d9arfd.execute-api.us-east-1.amazonaws.com/Sectores"));
    if(response.statusCode == 200){
      print(response.body);
      String body  = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for(var item  in jsonData["content"]){
        sectores.add(
          Sector(item["idSector"], item["nombreSector"], item["imageUrl"])
        );
      }
      return sectores;

    }else{
      throw Exception("Fallo de conexión");
    }
    return sectores;
  }


  @override
  void initState() {
    super.initState();
    _listSector = _getSector();
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
        toolbarHeight: 56, // default is 56
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
              child: FutureBuilder(
                future: _listSector,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return ListView(
                      children: _listSectores(snapshot.data),
                    );
                  }else{
                    print(snapshot.error);
                    return Center(child: CircularProgressIndicator(),);
                  }

                },
              )
            ),
          ],
        ),
      )),
    );
  }

  List<Widget> _listSectores(data){
    List<Widget> sect = [];

    for(var sec in data){
      sect.add(
        cardSector(
        titleSector: sec.nombre,
        imageSector: sec.image,
      )
      );
    }

    return sect;
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
              saveSector(titleSector);
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

  Future<void> saveSector(sector) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('dataSector', sector);
  }


///////////////////////////////
  /////////////este metodo esta diseñado para obtener el status de la PreSolicitud
  Future<void> getStatusPreSolicitud() async{
    print("Entrando al metodo insertCliente ");
    var url = "https://24ijin89wg.execute-api.us-east-1.amazonaws.com/postCliente";

    var response = await http.get(Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );

    if(response.statusCode == 200){
      print(response.body);
    }else{
      throw Exception("Error en getStatusPreSolicitud--> "+ response.body);
    }
  }
}

