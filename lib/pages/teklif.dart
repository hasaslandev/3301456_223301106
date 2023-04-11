import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
class Teklif extends StatefulWidget {
  const Teklif({
    Key? key,
  }) : super(key: key);

  @override
  _DropDownListExampleState createState() => _DropDownListExampleState();
}

class _DropDownListExampleState extends State<Teklif> {

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
      appBar: AppBar(
        title: const Text("Teklif Paneli"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: _mainBody(),
      ),
    );
  }

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
              "Teklif Paneli",
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
              title: "Hasta Adı Soyadı",
              hint: "Hasta Adı Soyadını Giriniz",
              isCitySelected: false,
            ),
            AppTextField(
              textEditingController: _cityTextEditingController,
              title: "Hastanın Kaldığı Hastane",
              hint: "Hastane Seçiniz",
              isCitySelected: true,
              cities: _listOfHospital,
            ),
            AppTextField(
              textEditingController: _phoneNumberTextEditingController,
              title: "İletişim",
              hint: "İletişim Adresinizi Giriniz",
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
              title: "Hastanın Hastalığını Seçiniz",
                 isCitySelected: true,
              hint: "Hastalık Giriniz", cities: _listOfCities,
            ),
            const SizedBox(height: 5),
            const SizedBox(
              height: 15.0,
            ),
            Column(
              children: [
                Text("Öngördüğünüz Fiyatı Belirleyiniz"),
                Slider(
                  value: _currentSliderValue,
                  max: 100000,
                  divisions: 1000,
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
              children: [
                Row(
                children: [
                  Text("Kadın:"),
                  Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    if(isChecked1==true){
                      return null;
                    }
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
                          if(isChecked==true){
                            return null;
                          }
                          isChecked1 = value!;
                        });
                      },
                    ),
                  ],
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
          "Ilan Ver",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
