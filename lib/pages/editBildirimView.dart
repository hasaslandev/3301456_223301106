import 'package:flutter/material.dart';
import 'package:randevu/models/bildirimModel.dart';
import 'package:randevu/pages/list_bildirims.dart';
import 'package:sqflite/sqflite.dart';

class EditBildirimView extends StatefulWidget {
  const EditBildirimView({Key? key}) : super(key: key);

  @override
  _EditBildirimViewState createState() => _EditBildirimViewState();
}

class _EditBildirimViewState extends State<EditBildirimView> {
  TextEditingController bildirimIdController = TextEditingController();
  TextEditingController bildirimTCController = TextEditingController();
  TextEditingController bildirimFiyatController = TextEditingController();

  late Future<Database> database;

  List<BildirimModel> bildirimList = [];

  _onPressedUpdate() async {
    final bildirimE = BildirimModel(
      id: int.parse(bildirimIdController.text),
      TC: bildirimTCController.text,
      fiyat: int.parse(bildirimFiyatController.text),
    );
    utils.updateBildirim(bildirimE);
    bildirimList = await utils.bildirims();
    //print(dogList);
    getData();
  }

  _onPressedAdd() async {
    final bildirimE = BildirimModel(
      id: int.parse(bildirimIdController.text),
      TC: bildirimTCController.text,
      fiyat: int.parse(bildirimFiyatController.text),
    );
    await utils.insertBildirim(bildirimE);
    bildirimList = await utils.bildirims();
    //print(dogList);
    getData();
  }

  _deleteBildirimTable() {
    utils.deleteTable();
    bildirimList = [];
    getData();
  }

  void getData() async {
    await utils.bildirims().then((result) => {
      setState(() {
        bildirimList = result.cast<BildirimModel>();
      })
    });
    print(bildirimList);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqlite Örneği',
      home: Scaffold(
        appBar: AppBar(title: const Text("Sqlite Örneği")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: bildirimIdController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter ID'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: bildirimTCController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter TC'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: bildirimFiyatController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Fiyat'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: _onPressedAdd, child: Text("Insert Bildirim")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: _onPressedUpdate, child: Text("Update Bildirim")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: _deleteBildirimTable,
                    child: const Text("Delete Bildirim Table")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListBildirims()),
                      );
                    },
                    child: Text("List Bildirims")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      getData();
                    },
                    child: Text("Refresh List")),
              ),
              Text(bildirimList.length.toString()),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: bildirimList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(bildirimList[index].TC!),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}