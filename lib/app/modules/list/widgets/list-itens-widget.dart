import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:listadecompras/app/modules/list/widgets/list-itens-slidable-widget.dart';
import 'package:mobx/mobx.dart';

class ListItensWidget extends StatefulWidget {
  const ListItensWidget({Key? key, required this.store}) : super(key: key);
  final ListStore store;
  @override
  ListItensWidgetState createState() => ListItensWidgetState(store: store);
}

class ListItensWidgetState extends ModularState<ListItensWidget, ListStore> {
  final ListStore store;

  ListItensWidgetState({Key? key, required this.store});

  @override
  Widget build(BuildContext context) {
    //print("log --Item: " + store.itemDescription[0]);
    loadItens();
    return Expanded(
        child: Observer(
            builder: (context) => ListView.builder(
                itemCount: store.itemDescription.length,
                key: UniqueKey(),
                itemBuilder: (context, index) {
                  print("log --Index: : " +
                      index.toString() +
                      "---itemDescription: " +
                      store.itemDescription[index] +
                      "----------------------");
                  return new ListItensSlidableWidget(
                      store: store, index: index, key: UniqueKey());
                })));
  }

  void loadItens() async {
    bool _getItem = await store.getAllItemDescription();
    bool _updateAll = await store.updateTextFormField();
    await asyncWhen((_) => _getItem && _updateAll);
  }
}
