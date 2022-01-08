import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:listadecompras/app/modules/list/widgets/list-itens-slidable-widget.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';
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
    print(store.listID);

    return Observer(
        builder: (context) => Container(
                child: StreamBuilder<QuerySnapshot>(
              stream: ListItensRepository().readItem(store.listID),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  print(snapshot.data!.docs.length);
                  return ListView(
                    children: snapshot.data!.docs.map(
                      (doc) {
                        store.incrementIndex();
                        print("log -- index: " + store.index.toString());
                        return ListItensSlidableWidget(
                            store: store, itemDescription: doc.get('Item'));
                      },
                    ).toList(),
                  );
                }
              },
            )));
  }
}
