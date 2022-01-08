import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';

class CardWidget extends StatefulWidget {
  const CardWidget(
      {Key? key, required this.store, required this.itemDescription})
      : super(key: key);
  final ListStore store;
  final String itemDescription;

  @override
  CardWidgetState createState() =>
      CardWidgetState(store: store, itemDescription: itemDescription);
}

class CardWidgetState extends ModularState<CardWidget, ListStore> {
  final ListStore store;
  final String itemDescription;

  CardWidgetState(
      {Key? key, required this.store, required this.itemDescription});
  TextEditingController txtItemDescription = new TextEditingController();

  void initState() {
    txtItemDescription.text = itemDescription;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      key: UniqueKey(),
      color: Colors.white, //MUDar cor DInamicamente
      child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: UniqueKey(),
          child: TextFormField(
            autofocus: false,
            controller: txtItemDescription,
            onTap: () {},
            onChanged: (value) async {
              //  isChanged = true;
              ListItensRepository().updateItem(
                  store.listID, store.itemID, itemDescription, store.itemColor);
            },
//                    onFieldSubmitted: (value) async =>
            //    store.updateAllItensDescription(),
          )),
    );
  }
}
