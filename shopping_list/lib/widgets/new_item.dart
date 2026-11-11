import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/models/category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewItem extends StatefulWidget {
  const NewItem({super.key});
  @override
  State<NewItem> createState(){
    return _NewItemState();
}
}

class _NewItemState extends State<NewItem> {

  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables];

  void _saveItem() async {
    if(_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final url = Uri.https(
        'flutter-apps-e52d6-default-rtdb.asia-southeast1.firebasedatabase.app',
        'shopping-list.json',
      );

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': _enteredName,
          'quantity': _enteredQuantity,
          'category': _selectedCategory!.title
        })
        );
      
      final Map<String, dynamic> resData = json.decode(response.body);

      Navigator.of(context).pop(
        GroceryItem(
          id: resData['name'],
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory!,
        )
      );
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(maxLength: 50,
            decoration: InputDecoration(label: const Text('Name')),
            onSaved: (value) {
              _enteredName = value!;
            },
            validator: (value) {
              if(value == null || value.isEmpty || value.trim().length <= 1) {
                return 'Must be longer than 1 character';
              }
              return null;
            }
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(label: const Text('Quantity')),
                    initialValue: _enteredQuantity.toString(),
                    onSaved: (value) {
                      _enteredQuantity = int.parse(value!);
                    },
                    validator: (value) {
                      if(value == null || value.isEmpty || int.tryParse(value) == null || int.tryParse(value)! <= 0) {
                        return 'Must be a valid, positive number';
                      }
                      return null;
                    }
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField(
                    initialValue: _selectedCategory,
                    items: [
                      for(final category in categories.entries)
                        DropdownMenuItem(
                          value: category.value,
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: category.value.color,
                              ),
                              SizedBox(width: 6),
                              Text(category.value.title)
                            ]
                          )
                        )
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                  )
                  )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {
                  _formKey.currentState!.reset();
                }, child: const Text('Reset')),
                ElevatedButton(onPressed: _saveItem, child: const Text('Save'))
              ],
              )
          ],
          )
        )
      ),
      );
  }
}