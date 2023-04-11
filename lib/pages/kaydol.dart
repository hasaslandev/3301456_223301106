import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class Kaydol extends StatefulWidget {
  const Kaydol({
    Key? key,
  }) : super(key: key);

  @override
  _DropDownListExampleState createState() => _DropDownListExampleState();
}

class _DropDownListExampleState extends State<Kaydol> {
  /// This is list of city which will pass to the drop down.
  double _currentSliderValue = 20;
  bool isChecked = false;
  bool isChecked1 = false;

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
  final List<SelectedListItem> _listOfHospital = [
    SelectedListItem(
      name: "Konya Numune Hastanesi",
      value: "TYO",
      isSelected: false,
    ),
    SelectedListItem(
      name: "İzmir Balkaçık Hastanesi",
      value: "NY",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Ankara Ustal Beyaz Hastanesi",
      value: "LDN",
      isSelected: false,
    ),
    SelectedListItem(name: "Adıyaman Merkez Hastanesi"),
    SelectedListItem(name: "Antalya Merkez Hastanesi"),
    SelectedListItem(name: "Bilecik Merkez Hastanesi"),
    SelectedListItem(name: "Şırnak Merkez Hastanesi"),
    SelectedListItem(name: "Mersin Merkez Hastanesi"),
    SelectedListItem(name: "Kahraman Maraş Merkez Hastanesi"),
    SelectedListItem(name: "Hatay Merkez Hastanesi"),
    SelectedListItem(name: "Aydın Merkez Hastanesi"),
    SelectedListItem(name: "Çanakkale Merkez Hastanesi"),
  ];

  /// This is register text field controllers.
  final TextEditingController _fullNameTextEditingController =
  TextEditingController();
  final TextEditingController _emailTextEditingController =
  TextEditingController();
  final TextEditingController _phoneNumberTextEditingController =
  TextEditingController();
  final TextEditingController _cityTextEditingController =
  TextEditingController();
  final TextEditingController _passwordTextEditingController =
  TextEditingController();

  final TextEditingController _textEditingController = TextEditingController();

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
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    return ListView(
      padding: const EdgeInsets.all(12.0),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: const [
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
            const Text(
              "Kayıt Ol",
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            AppTextField(
              textEditingController: _fullNameTextEditingController,
              title: "Adınız Soyadınız",
              hint: "Adınız Soyadınızı Giriniz",
              isCitySelected: false,
            ),
            AppTextField(
              textEditingController: _fullNameTextEditingController,
              title: "Kullanıcı Adınız",
              hint: "Kullanıcı Adınızı Belirleyiniz",
              isCitySelected: false,
            ),
            AppTextField(
              textEditingController: _cityTextEditingController,
              title: "Bulunulan Hastane",
              hint: "Hastane Seçiniz",
              isCitySelected: true,
              cities: _listOfHospital,
            ),
            AppTextField(
              textEditingController: _phoneNumberTextEditingController,
              title: "Telefon",
              hint: "Telefonunuzu Giriniz",
              isCitySelected: false,
            ),
            AppTextField(
              textEditingController: _cityTextEditingController,
              title: "Şehir",
              hint: "Şehirinizi Seçiniz",
              isCitySelected: true,
              cities: _listOfCities,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Column(
              children: [
                Text("Yaşınız"),
                Slider(
                  value: _currentSliderValue,
                  max: 120,
                  min: 18,
                  divisions: 102,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text("Kadın:"),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Erkek:"),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked1,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked1 = value!;
                        });
                      },
                    ),
                  ],
                ),

              ],
            ),
            Column(
              children: [
                AppTextField(
                  textEditingController: _passwordTextEditingController,
                  title: "Şifreniz",
                  hint: "Şifrenizi Belirleyiniz",
                  isCitySelected: false,
                ),
              ],
            ),
            _AppElevatedButton(),
            SizedBox(height: 20),
          ],
        ),
      ],
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
  final TextEditingController _searchTextEditingController =
  TextEditingController();

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
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
          for (var item in selectedList) {
            if (item is SelectedListItem) {
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
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
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
            contentPadding:
            const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
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
        child: const Text(
          "Kayıt Ol",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
