import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randevu/models/hastaModel.dart';
import 'package:randevu/providers/hastamodel_provider.dart';



class EditHastaModelView extends StatefulWidget {
  final HastaModel? hastaModel;

  EditHastaModelView([this.hastaModel]);

  @override
  _EditHastaModelView createState() => _EditHastaModelView();
}

class _EditHastaModelView extends State<EditHastaModelView> {
  final nameController = TextEditingController();
  final loginnameController = TextEditingController();
  final loginpasswordController = TextEditingController();
  final webController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    loginnameController.dispose();
    loginpasswordController.dispose();
    webController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.hastaModel == null) {
      //New Record
      nameController.text = "";
      loginnameController.text = "";
      loginpasswordController.text = "";
      webController.text = "";
      Future.delayed(Duration.zero, () {
        final hastamodelProvider =
        Provider.of<HastaModelProvider>(context, listen: false);
        hastamodelProvider.loadValues(HastaModel());
      });
    } else {
      //Controller Update
      nameController.text = widget.hastaModel!.ad! ?? "";;
      loginnameController.text = widget.hastaModel!.soyad! ?? "";;
      loginpasswordController.text = widget.hastaModel!.TC! ?? "";;
      webController.text = widget.hastaModel?.sehir ?? "";
      //State Update
      Future.delayed(Duration.zero, () {
        final hastamodelsProvider =
        Provider.of<HastaModelProvider>(context, listen: false);
        hastamodelsProvider.loadValues(widget.hastaModel!);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hastamodelsProvider = Provider.of<HastaModelProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: (widget.hastaModel != null)
              ? Text('Edit Hasta Firm')
              : Text('Add Hasta Firm')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Hasta AD'),
              onChanged: (value) {
                hastamodelsProvider.changeName(value);
              },
            ),
            TextField(
              controller: loginnameController,
              decoration: InputDecoration(hintText: 'Hasta SOyad'),
              onChanged: (value) {
                hastamodelsProvider.changeSName(value);
              },
            ),
            TextField(
              controller: loginpasswordController,
              decoration:
              InputDecoration(hintText: 'HastaTC'),
              onChanged: (value) {
                hastamodelsProvider.changeTC(value);
              },
            ),
            TextField(
              controller: webController,
              decoration:
              InputDecoration(hintText: 'Sehir'),
              onChanged: (value) {
                hastamodelsProvider.changeSehir(value);
              },
            ),

            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                hastamodelsProvider.saveHastaModel();
                Navigator.of(context).pop();
              },
            ),
            (widget.hastaModel != null)
                ? ElevatedButton(
              child: Text('Delete'),
              onPressed: () {
                hastamodelsProvider.removeHastaModel(widget.hastaModel!.hastaId!);
                Navigator.of(context).pop();
              },
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
