import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:listadecompras/app/modules/list/widgets/list-card-widget.dart';
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

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    reassemble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("log -- Slidable Construction, index: " + index.toString());
    return Container(
        child: Slidable(
      key: Key(Uuid().v1().toString()),
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        // dismissible: DismissiblePane(onDismissed: () {

        // }),
        children: [
          SlidableAction(
            onPressed: (value) {
              store.removeItemDescription(index);
              store.updateTextFormField();
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: slidableDelete,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (value) {
              store.changeColor(index);
            },
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: slidableEdit,
          ),
        ],
      ),
      child: CardWidget(
        store: store,
        index: index,
        formKey: formKey,
      ),
    ));
  }
}
