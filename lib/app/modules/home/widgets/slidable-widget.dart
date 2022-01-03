import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/repositories/list-repository.dart';
import 'package:uuid/uuid.dart';

class SlidebleWidget extends StatelessWidget {
  const SlidebleWidget(
      {Key? key, required this.slideBleTitle, required this.listID})
      : super(key: key);

  final String slideBleTitle;
  final String listID;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        key: Key(Uuid().v1().toString()),
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            ListRepository().deleteList(listID);
          }),
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
          dismissible: DismissiblePane(onDismissed: () {
            Modular.to.navigate('/list/' + listID);
          }),
          children: [
            SlidableAction(
              //flex: 2,
              onPressed: null,
              backgroundColor: Color(0xFF00BFA5),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: slidableEdit,
            ),
          ],
        ),
        child: Card(
          color: Colors.white, //Color(0xFF1DE9B6),
          child: ListTile(title: Text(slideBleTitle)),
        ),
      ),
    );
  }
}
