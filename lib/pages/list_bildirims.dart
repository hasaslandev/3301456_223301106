import "package:flutter/material.dart";
import "package:randevu/models/bildirimModel.dart";
import "package:randevu/pages/editBildirimView.dart";
import "package:randevu/services/Db/utils.dart";



DbUtils utils = DbUtils();

class ListBildirims extends StatefulWidget {
  @override
  _ListBildirimsState createState() => _ListBildirimsState();
}

class _ListBildirimsState extends State<ListBildirims> {
  List<BildirimModel> bildirimList = [];

  void getData() async {
    await utils.bildirims().then((result) => {
      setState(() {
        bildirimList = result;
      })
    });
    print(bildirimList);
  }

  void showAlert(String alertTitle, String alertContent) {
    AlertDialog alertDialog;
    alertDialog =
        AlertDialog(title: Text(alertTitle), content: Text(alertContent));
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bildirimList.length.toString() + " Bildirims listed")),
      body: SingleChildScrollView(
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
                    onTap: () {
                      showAlert("Bildirim " + index.toString() + " clicked",
                          "Bildirim " + index.toString() + " clicked");
                    },
                    onLongPress: () async {
                      await utils.deleteBildirim(bildirimList[index].id!).then((value) => {
                        showAlert("Bildirim " + index.toString() + " deleted",
                            "Bildirim " + index.toString() + " deleted")
                      });
                      getData();
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditBildirimView()),
                    );
                  },
                  child: Text("Return Homepage")),
            ),
          ],
        ),
      ),
    );
  }
}