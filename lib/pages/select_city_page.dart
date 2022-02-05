import 'package:flutter/material.dart';

class SelectCityPage extends StatelessWidget {
  const SelectCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textcontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Şehir Seç'),
      ),
      body: Form(
          child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textcontroller,
                decoration: InputDecoration(
                  labelText: 'Şehir',
                  hintText: 'Şehir seçin',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          IconButton(onPressed: () {
            Navigator.pop(context, _textcontroller.text);
          }, icon: Icon(Icons.search)),
        ],
      )),
    );
  }
}
