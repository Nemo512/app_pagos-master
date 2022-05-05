// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiService {
  static final String PDF_URL =
      "https://v2.convertapi.com/d/b994ffsn1r2gq3catwjilij45zft61s0/MEXI_000006.pdf";

  static Future<String> loadPDF() async {
    var response = await http.get(Uri.parse(PDF_URL));
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/data.pdf");
    await file.writeAsBytes(response.bodyBytes, flush: true);
    return file.path;
  }
}
