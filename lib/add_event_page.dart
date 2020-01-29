import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xpenz/drop_down_menu.dart';
import 'package:xpenz/item.dart';
import 'package:xpenz/my_icons_icons.dart';
import 'package:xpenz/regex.dart';
import 'package:xpenz/single_line_textfield.dart';
import 'package:xpenz/toast.dart';

final List<String> defaultCategories = [
  'Entertainment',
  'Food & Drink',
  'Online payment',
  'Movie',
  'Game',
  'Shopping',
  'Academic',
  'Top-up'
];

int selectedRadio = 0;

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  var eventNameController = TextEditingController();
  var descriptionController = TextEditingController();
  var amountController = TextEditingController();
  var walletTypeController = TextEditingController();
  var categoryController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    eventNameController.dispose();
    descriptionController.dispose();
    amountController.dispose();
    walletTypeController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dateText = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
    return Scaffold(
        appBar: AppBar(
            title: ListTile(
          leading: Text(
            'Add new event',
            style: TextStyle(fontSize: 18),
          ),
          trailing: IconButton(
            icon: Icon(Icons.check, color: Colors.indigoAccent),
            onPressed: () async {
              // TODO: check empty values
              if (!formKey.currentState.validate()) {
                await showToast(
                    context: context,
                    content: 'Please correct all invalid values before saving.',
                    duration: Duration(milliseconds: 1500),
                    toastPosition: ToastPosition.Bottom | ToastPosition.Center);
                return;
              }
              Navigator.pop(
                  context,
                  Item(
                      eventName: eventNameController.text,
                      description: descriptionController.text,
                      amount: double.parse(amountController.text),
                      dateTime: dateText,
                      category: categoryController.text));
            },
          ),
        )),
        body: Form(
            autovalidate: true,
            key: formKey,
            child: Column(children: <Widget>[
              singleLineTextField(
                  hintText: 'Event name',
                  leadingIcon: Icons.event,
                  controller: eventNameController,
                  validator: (v) =>
                      v.isEmpty ? 'Event name must not be empty' : null),
              singleLineTextField(
                  hintText: 'Description',
                  leadingIcon: Icons.description,
                  controller: descriptionController),
              singleLineTextField(
                  hintText: 'Amount',
                  leadingIcon: MyIcons.attach_money,
                  controller: amountController,
                  inputType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  validator: (v) => v != '0' && Regex.isMatch(r'-?\d*\.?\d+', v)
                      ? null
                      : 'Invalid value'),
              DropDownMenu(
                  values: defaultCategories,
                  leadingIcon: Icons.category,
                  controller: categoryController)
            ])));
  }
}
