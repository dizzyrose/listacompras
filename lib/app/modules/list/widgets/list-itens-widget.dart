import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:listadecompras/app/modules/list/widgets/list-itens-slidable-widget.dart';

class ListItensWidget extends StatelessWidget {
  final ListStore store;

  ListItensWidget({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    store.getAllItemDescription();

    //print("log --Item: " + store.itemDescription[0]);
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
}
