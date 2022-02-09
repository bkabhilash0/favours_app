import 'package:favours_app/models/friend_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class RequestFavourPage extends StatelessWidget {
  static String routeName = "/request-favour";
  final List<Friend> friends;
  const RequestFavourPage({Key? key, required this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Requesting a Favour"),
        leading: const CloseButton(),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Save"),
            style: TextButton.styleFrom(
                textStyle: const TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButtonFormField<String>(
              decoration:
                  const InputDecoration(labelText: "Favour Description"),
              value: friends[0].name,
              items: friends
                  .map((e) => DropdownMenuItem(
                        child: Text(e.name),
                        value: e.name,
                      ))
                  .toList(),
              onChanged: (value) {}),
          TextFormField(
            maxLines: 5,
            inputFormatters: [LengthLimitingTextInputFormatter(200)],
            decoration: const InputDecoration(labelText: "Favour Description"),
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
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              }),
        ],
      ),
    );
  }
}
