import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Eczane> fetchEczane() async {
  final response = await http
      .get(Uri.parse('https://api.collectapi.com/health/dutyPharmacy?ilce=Seydişehir&il=Konya'),headers: {
    HttpHeaders.contentTypeHeader:'application/json',
    HttpHeaders.authorizationHeader: 'apikey 2V61383xqYfEdSygCC3iV1:2sGdi3sU2eqglrWqR4NwUD',
  },);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Eczane.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Eczane {
  bool? success;
  List<Result>? result;

  Eczane({this.success, this.result});

  Eczane.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? name;
  String? dist;
  String? address;
  String? phone;
  String? loc;

  Result({this.name, this.dist, this.address, this.phone, this.loc});

  Result.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dist = json['dist'];
    address = json['address'];
    phone = json['phone'];
    loc = json['loc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dist'] = this.dist;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['loc'] = this.loc;
    return data;
  }
}


class EczaneApi extends StatefulWidget {
  EczaneApi({super.key});

  @override
  State<EczaneApi> createState() => _MyAppState();
}

class _MyAppState extends State<EczaneApi> {
  late Future<Eczane> futureEczane;

  @override
  void initState() {
    super.initState();
    futureEczane = fetchEczane();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Eczane>(
            future: futureEczane,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data!.result![0].name);
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.result?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: Colors.amber,
                        child: Center(child:
                        Row(
                          children: [
                            Text('name ${snapshot.data!.result![index].name}'),
                            Text('phone ${snapshot.data!.result![index].phone}'),
                            Text('address ${snapshot.data!.result![index].address}'),
                            Text('dist ${snapshot.data!.result![index].dist}'),
                            Text('loc ${snapshot.data!.result![index].loc}'),
                          ],
                        )),
                      );
                    }
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}