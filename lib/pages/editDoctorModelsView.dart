import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randevu/models/doktorModel.dart';


import '../providers/doktormodel_provider.dart';


class EditDoctorModelView extends StatefulWidget {
  final DoktorModel? doktorModel;

  EditDoctorModelView([this.doktorModel]);

  @override
  _EditDoctorModelView createState() => _EditDoctorModelView();
}

class _EditDoctorModelView extends State<EditDoctorModelView> {
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
    if (widget.doktorModel == null) {
      //New Record
      nameController.text = "";
      loginnameController.text = "";
      loginpasswordController.text = "";
      webController.text = "";
      Future.delayed(Duration.zero, () {
        final doktormodelProvider =
        Provider.of<DoktorModelProvider>(context, listen: false);
        doktormodelProvider.loadValues(DoktorModel());
      });
    } else {
      //Controller Update
      nameController.text = widget.doktorModel!.isim!;
      loginnameController.text = widget.doktorModel!.pozisyon!;
      loginpasswordController.text = widget.doktorModel!.bKisaAciklama!;
      webController.text = widget.doktorModel!.resim!;
      //State Update
      Future.delayed(Duration.zero, () {
        final doktormodelsProvider =
        Provider.of<DoktorModelProvider>(context, listen: false);
        doktormodelsProvider.loadValues(widget.doktorModel!);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final doktormodelsProvider = Provider.of<DoktorModelProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: (widget.doktorModel != null)
              ? Text('Edit Doktor Firm')
              : Text('Add Doktor Firm')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Doktor Firm Name'),
              onChanged: (value) {
                doktormodelsProvider.changeName(value);
              },
            ),
            TextField(
              controller: loginnameController,
              decoration: InputDecoration(hintText: 'Pozisyon Firm Login Name'),
              onChanged: (value) {
                doktormodelsProvider.changePozisyon(value);
              },
            ),
            TextField(
              controller: loginpasswordController,
              decoration:
              InputDecoration(hintText: 'Kısa AÇıklama Firm Login Password'),
              onChanged: (value) {
                doktormodelsProvider.changeKisaAciklama(value);
              },
            ),
            TextField(
              controller: webController,
              decoration: InputDecoration(hintText: 'Resim Firm Web'),
              onChanged: (value) {
                doktormodelsProvider.changeResim(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                doktormodelsProvider.saveDoktorModel();
                Navigator.of(context).pop();
              },
            ),
            (widget.doktorModel != null)
                ? ElevatedButton(
              child: Text('Delete'),
              onPressed: () {
                doktormodelsProvider.removeDoktorModel(widget.doktorModel!.doctorId!);
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
