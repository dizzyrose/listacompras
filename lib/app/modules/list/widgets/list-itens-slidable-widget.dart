import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/domain/app-globals.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';
import 'package:uuid/uuid.dart';

class ListItensSlidableWidget extends StatefulWidget {
  const ListItensSlidableWidget(
      {Key? key,
      required this.itemDescription,
      required this.itemIndex,
      required this.itemID,
      required this.itemColor})
      : super(key: key);
  final String itemDescription;
  final int itemIndex;
  final String itemID;
  final int itemColor;
  @override
  _ListItensSlidableWidgetState createState() => _ListItensSlidableWidgetState(
      key: UniqueKey(),
      itemDescription: itemDescription,
      itemIndex: itemIndex,
      itemID: itemID,
      itemColor: itemColor);
}

class _ListItensSlidableWidgetState extends State<ListItensSlidableWidget> {
  _ListItensSlidableWidgetState(
      {Key? key,
      required this.itemDescription,
      required this.itemIndex,
      required this.itemID,
      required this.itemColor});

  final ListStore store = Modular.get();
  final String itemDescription;
  final int itemIndex;
  final String itemID;
  final int itemColor;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var oldColor = false;
    store.setDefaultValues();
    store.setInitValues();
    return Container(
        child: Slidable(
      key: Key(Uuid().v1().toString()),
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          listItensRecoverd.removeAt(itemIndex);
          ListItensRepository().updateItem(listItensRecoverd, itemID);
          store.updateList(itemIndex);
        }),
        children: [
          SlidableAction(
            onPressed: (value) {},
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
            onPressed: (value) {
              print("colorChanged");
              store.changeColor(itemIndex, oldColor);
              oldColor = !oldColor;
            },
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: slidableEdit,
          ),
        ],
      ),
      child: Observer(
        builder: (_) => Card(
          key: Key(Uuid().v1().toString()),
          color: Color(store.colorCard[itemIndex]),
          child: Form(
              // autovalidateMode: AutovalidateMode.disabled,
              key: _formKey,
              child: TextFormField(
                autofocus: false,
                controller: store.txtItemDescription[itemIndex],
                onEditingComplete: () {
                  for (int i = 0; i < listItensRecoverd.length; i++) {
                    print(listItensRecoverd[i]);
                  }
                  listItensRecoverd.removeAt(itemIndex);
                  listItensRecoverd.insert(
                      itemIndex, store.txtItemDescription[itemIndex].text);
                  ListItensRepository().updateItem(listItensRecoverd, itemID);
                },
              )),
        ),
      ),
    ));
  }
}
