import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:randevu/models/doktorModel.dart';
import 'package:randevu/models/side_drawer.dart';
import 'package:randevu/pages/editDoctorModelsView.dart';

class DoktorModelsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doktormodel = context.watch<List<DoktorModel>>();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Doktor Models'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditDoctorModelView()));
            },
          )
        ],
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu_rounded,
                size: 40,
                color: Colors.black,
              ),
              color: Colors.black,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
      ),
      drawer: CustomSideDrawer(),
      body: ListView.builder(
        itemCount: doktormodel.length,
        itemBuilder: (context, index) {
          final isim = doktormodel[index].isim;
          final pozisyon = doktormodel[index].pozisyon;
          final resim = doktormodel[index].resim ?? '';

          return ListTile(
            leading: const Icon(
              Icons.beach_access,
              color: Colors.blue,
              size: 36.0,
            ),
            title: Text(isim!),
            subtitle: Text(pozisyon!),
            trailing: Text(resim),
            isThreeLine: true,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditDoctorModelView(doktormodel[index])));
            },
          );
        },
      ),
    );
  }
}
