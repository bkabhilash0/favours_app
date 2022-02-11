import 'package:favours_app/models/friend_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class RequestFavourPage extends StatefulWidget {
  static String routeName = "/request-favour";
  final List<Friend> friends;
  const RequestFavourPage({Key? key, required this.friends}) : super(key: key);

  @override
  State<RequestFavourPage> createState() => _RequestFavourPageState();
}

class _RequestFavourPageState extends State<RequestFavourPage> {
  final _formKey = GlobalKey<FormState>();

  void save() {
    if (_formKey.currentState == null) {
      return;
    }
    if (_formKey.currentState!.validate()) {
      // Store the Favour on Firebase;
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Requesting a Favour"),
        leading: const CloseButton(),
        actions: [
          TextButton(
            onPressed: () {
              save();
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              primary: Colors.indigo,
                textStyle: const TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
                decoration:
                    const InputDecoration(labelText: "Favour Description"),
                value: widget.friends[0].name,
                items: widget.friends
                    .map((e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e.name,
                        ))
                    .toList(),
                onChanged: (value) {}),
            TextFormField(
              maxLines: 5,
              inputFormatters: [LengthLimitingTextInputFormatter(200)],
              decoration:
                  const InputDecoration(labelText: "Favour Description"),
              validator: (value) {
                if (!(value!.trim().isNotEmpty)) {
                  return "This is a Required Field!";
                }
                return null;
              },
            ),
            DateTimeField(
                format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
                decoration: const InputDecoration(
                  labelText: 'Date/Time',
                ),
                onChanged: (dt) {
                  if (kDebugMode) {
                    print(dt);
                  }
                },
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now()),
                    );
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                }),
          ],
        ),
      ),
    );
  }
}
