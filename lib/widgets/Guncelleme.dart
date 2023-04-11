import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class Guncelleme extends StatefulWidget {
  const Guncelleme({
    Key? key,
  }) : super(key: key);

  @override
  _DropDownListExampleState createState() => _DropDownListExampleState();
}

class _DropDownListExampleState extends State<Guncelleme> {
  /// This is list of city which will pass to the drop down.
  final List<SelectedListItem> _listOfCities = [
    SelectedListItem(
      name: "Konya",
      value: "TYO",
      isSelected: false,
    ),
    SelectedListItem(
      name: "İzmir",
      value: "NY",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Ankara",
      value: "LDN",
      isSelected: false,
    ),
    SelectedListItem(name: "Adıyaman"),
    SelectedListItem(name: "Antalya"),
    SelectedListItem(name: "Bilecik"),
    SelectedListItem(name: "Şırnak"),
    SelectedListItem(name: "Mersin"),
    SelectedListItem(name: "Kahraman Maraş"),
    SelectedListItem(name: "Hatay"),
    SelectedListItem(name: "Aydın"),
    SelectedListItem(name: "Çanakkale"),
  ];

  /// This is register text field controllers.
  final TextEditingController _fullNameTextEditingController = TextEditingController();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _phoneNumberTextEditingController = TextEditingController();
  final TextEditingController _cityTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fullNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _phoneNumberTextEditingController.dispose();
    _cityTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _mainBody(),
      ),
    );
  }

  /// This is Main Body widget.
  Widget _mainBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            textEditingController: _fullNameTextEditingController,
            title: "Adınız",
            hint: "Adınızı giriniz",
            isCitySelected: false,
          ),
          AppTextField(
            textEditingController: _emailTextEditingController,
            title: "E-Mail",
            hint: "E-Mailinizi giriniz",
            isCitySelected: false,
          ),
          AppTextField(
            textEditingController: _phoneNumberTextEditingController,
            title: "Telefon",
            hint: "Telefon Numaranızı Giriniz",
            isCitySelected: false,
          ),
          AppTextField(
            textEditingController: _cityTextEditingController,
            title: "Şehir",
            hint: "Şehirinizi Seçiniz",
            isCitySelected: true,
            cities: _listOfCities,
          ),
          AppTextField(
            textEditingController: _passwordTextEditingController,
            title: "Şifre",
            hint: "Şifrenizi Giriniz",
            isCitySelected: false,
          ),
          const SizedBox(
            height: 15.0,
          ),
          _AppElevatedButton(),
        ],
      ),
    );
  }
}

/// This is Common App textfiled class.
class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<SelectedListItem>? cities;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final TextEditingController _searchTextEditingController = TextEditingController();

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        bottomSheetTitle:  const Text(
          "Şehirler",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Onayla',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for(var item in selectedList) {
            if(item is SelectedListItem) {
              list.add(item.name);
            }
          }
          showSnackBar(list.toString());
        },
        enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          onTap: widget.isCitySelected
              ? () {
            FocusScope.of(context).unfocus();
            onTextFieldTap();
          }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding: const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

/// This is common class for 'REGISTER' elevated button.
class _AppElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(00, 06, 00, 01),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        child:  const Text(
          "Güncelle",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}