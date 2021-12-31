import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/repositories/list-repository.dart';
import 'package:uuid/uuid.dart';

class ListItensSlidebleWidget extends StatelessWidget {
  const ListItensSlidebleWidget(
      {Key? key, required this.itemDescription, required this.itemIndex})
      : super(key: key);

  final String itemDescription;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        key: Key(Uuid().v1().toString()),
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: null,
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: slidableDelete,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              //flex: 2,
              onPressed: null,
              backgroundColor: Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: slidableEdit,
            ),
          ],
        ),
        child: Card(
          color: Colors.yellow,
          child: ListTile(title: Text(itemDescription)),
        ),
      ),
    );
  }
}
