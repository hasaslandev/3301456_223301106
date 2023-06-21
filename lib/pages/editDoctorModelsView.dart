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
  final pozisyonController = TextEditingController();
  final yildizController = TextEditingController();
  final toplamGoruntulenmeController = TextEditingController();
  final resimController = TextEditingController();
  final bKisaAciklamaController = TextEditingController();
  final bUzunAciklamaController = TextEditingController();
  final emailController = TextEditingController();
  final sifreController = TextEditingController();
  final telefonController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    pozisyonController.dispose();
    yildizController.dispose();
    resimController.dispose();
    bKisaAciklamaController.dispose();
    bUzunAciklamaController.dispose();
    emailController.dispose();
    sifreController.dispose();
    telefonController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.doktorModel == null) {
      //New Record
      nameController.text = "";
      pozisyonController.text = "";
      yildizController.text = "";
      resimController.text = "";
      bKisaAciklamaController.text = "";
      bUzunAciklamaController.text = "";
      emailController.text = "";
      sifreController.text = "";
      telefonController.text = "";
      Future.delayed(Duration.zero, () {
        final doktormodelProvider =
        Provider.of<DoktorModelProvider>(context, listen: false);
        doktormodelProvider.loadValues(DoktorModel());
      });
    } else {
      //Controller Update
      nameController.text = widget.doktorModel!.isim!;
      pozisyonController.text = widget.doktorModel!.pozisyon!;
      yildizController.text = widget.doktorModel!.yildiz!.toString();
      resimController.text = widget.doktorModel!.resim!;
      bKisaAciklamaController.text= widget.doktorModel!.bKisaAciklama!;
      bUzunAciklamaController.text =widget.doktorModel!.bUzunAciklama!;
      emailController.text =widget.doktorModel!.email!;
      sifreController.text =widget.doktorModel!.sifre!;
      telefonController.text= widget.doktorModel!.telefon!;
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
              ? Text('Doktor Düzenleme')
              : Text('Doktor EKle')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Doktor Adı Soyadı'),
              onChanged: (value) {
                doktormodelsProvider.changeName(value);
              },
            ),
            TextField(
              controller: pozisyonController,
              decoration: InputDecoration(hintText: 'Doktor Pozisyonu'),
              onChanged: (value) {
                doktormodelsProvider.changePozisyon(value);
              },
            ),
            TextField(
              controller: yildizController,
              decoration:
              InputDecoration(hintText: 'Doktorun yıldızı(Max 5 olmalıdır)'),
              onChanged: (value) {
                doktormodelsProvider.changeYildiz(int.parse(value));
              },
            ),
            TextField(
              controller: resimController,
              decoration: InputDecoration(hintText: 'Resim yolu'),
              onChanged: (value) {
                doktormodelsProvider.changeResim(value);
              },
            ),
            TextField(
              controller: bKisaAciklamaController,
              decoration:
              InputDecoration(hintText: 'Kısa Açıklama'),
              onChanged: (value) {
                doktormodelsProvider.changeKisaAciklama(value);
              },
            ),
            TextField(
              controller: bUzunAciklamaController,
              decoration:
              InputDecoration(hintText: 'Uzun Aciklama'),
              onChanged: (value) {
                doktormodelsProvider.changeUzunAciklama(value);
              },
            ),
            TextField(
              controller: emailController,
              decoration:
              InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                doktormodelsProvider.changeEmail(value);
              },
            ),
            TextField(
              controller: sifreController,
              decoration:
              InputDecoration(hintText: 'Sifre'),
              onChanged: (value) {
                doktormodelsProvider.changeSifre(value);
              },
            ),
            TextField(
              controller: telefonController,
              decoration:
              InputDecoration(hintText: 'Telefon'),
              onChanged: (value) {
                doktormodelsProvider.changeTelefon(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Kaydet'),
              onPressed: () {
                doktormodelsProvider.saveDoktorModel();
                Navigator.of(context).pop();
              },
            ),
            (widget.doktorModel != null)
                ? ElevatedButton(
              child: Text('Sil'),
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
