import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:randevu/models/side_drawer.dart';
import 'package:randevu/pages/editHastaModelsView.dart';

import '../models/hastaModel.dart';

class HastaEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hastamodel = context.watch<List<HastaModel>>();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Hasta Models'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditHastaModelView()));
            },
          )
        ],
      ),

      body: ListView.builder(
        itemCount: hastamodel.length,
        itemBuilder: (context, index) {
          final isim = hastamodel[index].ad?? '';
          final soyad = hastamodel[index].soyad ?? '';
          final TC = hastamodel[index].TC ?? '';

          return ListTile(
            leading: const Icon(
              Icons.beach_access,
              color: Colors.blue,
              size: 36.0,
            ),
            title: Text(isim!),
            subtitle: Text(soyad!),
            trailing: Text(TC!),
            isThreeLine: true,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditHastaModelView(hastamodel[index])));
            },
          );
        },
      ),
    );
  }
}

