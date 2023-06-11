import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchIlceAdlari() async {
  List<String> ilceAdlari = [];

  http.Response response = await http.get(Uri.parse('https://data.ibb.gov.tr/tr/dataset/bd3b9489-c7d5-4ff3-897c-8667f57c70bb/resource/6800ea2d-371b-4b90-9cf1-994a467145fd/download/salk-kurum-ve-kurulularna-ait-bilgiler.json'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);
    ilceAdlari = jsonData.map((item) => item['ILCE_ADI'].toString()).toSet().toList();
  } else {
    throw Exception('API isteği başarısız oldu. Hata kodu: ${response.statusCode}');
  }

  return ilceAdlari;
}
