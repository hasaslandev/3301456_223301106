import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class EczaneApi extends StatefulWidget {
  EczaneApi({Key? key});

  @override
  State<EczaneApi> createState() => _EczaneApiState();
}

class _EczaneApiState extends State<EczaneApi> {
  late Future<Eczane> futureEczane;

  @override
  void initState() {
    super.initState();
    futureEczane = fetchEczane();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nöbetçi Eczane',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nöbetçi Eczane'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: FutureBuilder<Eczane>(
            future: futureEczane,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: snapshot.data!.result?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final eczane = snapshot.data!.result![index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: Icon(
                          Icons.medical_services,
                          size: 48,
                          color: Colors.blue,
                        ),
                        title: Text(
                          eczane.name ?? '',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Text(
                              eczane.address ?? '',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SizedBox(height: 4),
                            Text(
                              eczane.dist ?? '',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SizedBox(height: 4),
                            InkWell(
                              onTap: () {
                                _launchPhone(eczane.phone);
                              },
                              child: Text(
                                eczane.phone ?? '',
                                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text(
                  'Failed to load data: ${snapshot.error}',
                  style: Theme.of(context).textTheme.bodyText2,
                );
              }

              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

Future<Eczane> fetchEczane() async {
  final response = await http.get(
    Uri.parse('https://api.collectapi.com/health/dutyPharmacy?ilce=Seydişehir&il=Konya'),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'apikey 2V61383xqYfEdSygCC3iV1:2sGdi3sU2eqglrWqR4NwUD',
    },
  );

  if (response.statusCode == 200) {
    return Eczane.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class Eczane {
  bool? success;
  List<Result>? result;

  Eczane({this.success, this.result});

  factory Eczane.fromJson(Map<String, dynamic> json) {
    return Eczane(
      success: json['success'],
      result: List<Result>.from(json['result']?.map((x) => Result.fromJson(x))),
    );
  }
}

class Result {
  String? name;
  String? dist;
  String? address;
  String? phone;
  String? loc;

  Result({this.name, this.dist, this.address, this.phone, this.loc});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name: json['name'],
      dist: json['dist'],
      address: json['address'],
      phone: json['phone'],
      loc: json['loc'],
    );
  }
}

void _launchPhone(String? phoneNumber) async {
  if (phoneNumber != null && phoneNumber.isNotEmpty) {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    final String url = phoneUri.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
