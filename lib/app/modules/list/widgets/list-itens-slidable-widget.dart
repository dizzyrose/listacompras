import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:uuid/uuid.dart';

class ListItensSlidableWidget extends StatefulWidget {
  const ListItensSlidableWidget(
      {Key? key, required this.store, required this.index})
      : super(key: key);
  final ListStore store;
  final int index;

  @override
  _ListItensSlidableWidgetState createState() => _ListItensSlidableWidgetState(
      key: UniqueKey(), store: store, index: index);
}

class _ListItensSlidableWidgetState
    extends ModularState<ListItensSlidableWidget, ListStore> {
  _ListItensSlidableWidgetState(
      {Key? key, required this.store, required this.index});

  final ListStore store;
  final int index;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    store.setDefaultValues();
    store.setInitValues();
    reassemble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
          key: Key(Uuid().v1().toString()),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(onDismissed: () {
              store.removeItemDescription(index);
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
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (value) {
                  print("value: " + value.toString());
                  store.changeColor(store.itemIndex[index]);
                },
                backgroundColor: Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: slidableEdit,
              ),
            ],
          ),
          child: Observer(
              builder: (context) => Card(
                    key: Key(Uuid().v1().toString()),
                    color: store.colorCard[store.itemIndex[index]],
                    child: Form(
                        // autovalidateMode: AutovalidateMode.disabled,
                        key: _formKey,
                        child: TextFormField(
                          autofocus: false,
                          controller:
                              store.txtItemDescription[store.itemIndex[index]],
                          onChanged: (value) {
                            store.updateItemDesciption(value, index);
                          },
                        )),
                  ))),
    );
  }
}
