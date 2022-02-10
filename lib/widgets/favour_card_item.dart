import 'package:favours_app/models/favour_model.dart';
import 'package:favours_app/pages/FavoursPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FavourCardItem extends StatelessWidget {
  final Favor favour;
  const FavourCardItem({Key? key, required this.favour}) : super(key: key);

  Widget _itemHeader(BuildContext context, Favor favour) {
    return Row(children: [
      CircleAvatar(
        backgroundImage: NetworkImage(favour.friend.photoURL),
      ),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text("${favour.friend.name} asked you to..."),
      ))
    ]);
  }

  Widget _itemFooter(BuildContext context, Favor favour) {
    if (favour.isCompleted) {
      final format = DateFormat();
      return Container(
        margin: const EdgeInsets.only(top: 8),
        alignment: Alignment.centerRight,
        child: Chip(
            label: Text("Completed on ${format.format(favour.completed!)}")),
      );
    }
    if (favour.isRequested) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                FavoursPageState.of(context).refuseToDo(favour);
              },
              style: TextButton.styleFrom(primary: Colors.red),
              child: const Text(
                "Refuse",
                style: TextStyle(color: Colors.red),
              )),
          TextButton(onPressed: () {}, child: const Text("Do")),
        ],
      );
    }
    if (favour.isDoing) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(onPressed: () {}, child: const Text("Give Up")),
          TextButton(onPressed: () {}, child: const Text("Complete")),
        ],
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(favour.uuid),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _itemHeader(context, favour),
            Text(favour.description),
            _itemFooter(context, favour)
          ],
        ),
      ),
    );
  }
}
