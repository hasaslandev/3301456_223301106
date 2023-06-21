import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randevu/models/hastaModel.dart';
import 'package:randevu/providers/hastamodel_provider.dart';

class EditHastaModelView extends StatefulWidget {
  final HastaModel? hastaModel;

  EditHastaModelView([this.hastaModel]);

  @override
  _EditHastaModelViewState createState() => _EditHastaModelViewState();
}

class _EditHastaModelViewState extends State<EditHastaModelView> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final TCController = TextEditingController();
  final hastaneController = TextEditingController();
  final emailController = TextEditingController();
  final telefonController = TextEditingController();
  final sehirController = TextEditingController();
  final yasController = TextEditingController();
  bool? selectedCinsiyet;
  final sifreController = TextEditingController();
  final resimController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    TCController.dispose();
    hastaneController.dispose();
    emailController.dispose();
    telefonController.dispose();
    sehirController.dispose();
    yasController.dispose();
    sifreController.dispose();
    resimController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.hastaModel == null) {
      // New Record
      nameController.text = "";
      surnameController.text = "";
      TCController.text = "";
      hastaneController.text = "";
      emailController.text = "";
      telefonController.text = "";
      sehirController.text = "";
      yasController.text = "";
      selectedCinsiyet = null;
      sifreController.text = "";
      resimController.text = "";

      Future.delayed(Duration.zero, () {
        final hastamodelProvider =
        Provider.of<HastaModelProvider>(context, listen: false);
        hastamodelProvider.loadValues(HastaModel());
      });
    } else {
      // Controller Update
      nameController.text = widget.hastaModel!.ad ?? "";
      surnameController.text = widget.hastaModel!.soyad ?? "";
      TCController.text = widget.hastaModel!.TC ?? "";
      sehirController.text = widget.hastaModel?.sehir ?? "";
      hastaneController.text = widget.hastaModel?.hastane ?? "";
      emailController.text = widget.hastaModel?.email ?? "";
      telefonController.text = widget.hastaModel?.telefon ?? "";
      yasController.text = widget.hastaModel?.yas.toString() ?? "";
      selectedCinsiyet = widget.hastaModel?.cinsiyet;
      sifreController.text = widget.hastaModel?.sifre ?? "";
      resimController.text = widget.hastaModel?.resim ?? "";

      // State Update
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
            ? Text('Hastayı Düzenle')
            : Text('Hastayı Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Hasta Adı'),
              onChanged: (value) {
                hastamodelsProvider.changeName(value);
              },
            ),
            TextField(
              controller: surnameController,
              decoration: InputDecoration(hintText: 'Hasta Soyadı'),
              onChanged: (value) {
                hastamodelsProvider.changeSName(value);
              },
            ),
            TextField(
              controller: TCController,
              decoration: InputDecoration(hintText: 'Hasta TC'),
              onChanged: (value) {
                hastamodelsProvider.changeTC(value);
              },
            ),
            TextField(
              controller: sehirController,
              decoration: InputDecoration(hintText: 'Şehir'),
              onChanged: (value) {
                hastamodelsProvider.changeSehir(value);
              },
            ),
            TextField(
              controller: hastaneController,
              decoration: InputDecoration(hintText: 'Hastane'),
              onChanged: (value) {
                hastamodelsProvider.changeHastane(value);
              },
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                hastamodelsProvider.changeEmail(value);
              },
            ),
            TextField(
              controller: telefonController,
              decoration: InputDecoration(hintText: 'Telefon'),
              onChanged: (value) {
                hastamodelsProvider.changeTelefon(value);
              },
            ),
            TextField(
              controller: yasController,
              decoration: InputDecoration(hintText: 'Yaş'),
              onChanged: (value) {
                hastamodelsProvider.changeYas(int.tryParse(value) ?? 0);
              },
            ),
            Row(
              children: <Widget>[
                Text('Cinsiyet'),
                Radio<bool>(
                  value: true,
                  groupValue: selectedCinsiyet,
                  onChanged: (bool? value) {
                    setState(() {
                      selectedCinsiyet = value;
                      hastamodelsProvider.changeCinsiyet(value ?? false);
                    });
                  },
                ),
                Text('Erkek'),
                Radio<bool>(
                  value: false,
                  groupValue: selectedCinsiyet,
                  onChanged: (bool? value) {
                    setState(() {
                      selectedCinsiyet = value;
                      hastamodelsProvider.changeCinsiyet(value ?? false);
                    });
                  },
                ),
                Text('Kadın'),
              ],
            ),
            TextField(
              controller: sifreController,
              decoration: InputDecoration(hintText: 'Şifre'),
              onChanged: (value) {
                hastamodelsProvider.changeSifre(value);
              },
            ),
            TextField(
              controller: resimController,
              decoration: InputDecoration(hintText: 'Resim'),
              onChanged: (value) {
                hastamodelsProvider.changeResim(value);
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Kaydet'),
              onPressed: () {
                hastamodelsProvider.saveHastaModel();
                Navigator.of(context).pop();
              },
            ),
            (widget.hastaModel != null)
                ? ElevatedButton(
              child: Text('Sil'),
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
