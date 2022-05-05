import 'dart:convert';

import 'package:http/http.dart' as http;

class CodigoPostalExterno {
  List datosDomicilio = [];
  Future getCodigoPostal(String codigoPostal) async {
    var token = '81f2a82c-58fc-46d8-9186-dda92c3f5125';
    final url =
        'https://api.copomex.com/query/info_cp/$codigoPostal?type=simplified&token=$token';
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return null;
    final responseData = json.decode(response.body);

    return responseData;
  }
}
