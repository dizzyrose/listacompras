import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:listadecompras/app/modules/list/widgets/list-itens-slidable-widget.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

class ListItensWidget extends StatelessWidget {
  final ListStore store;

  ListItensWidget({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: ListItensRepository().readItem(store.itemID),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.none &&
              // ignore: unnecessary_null_comparison
              snap.hasData == null) {
            return CircularProgressIndicator();
          }

          return ListView.builder(
              itemCount: snap.data?.length,
              itemBuilder: (context, index) {
                store.setItemIndex(index);
                store.itemDescription.add(snap.data[index]);
                return new ListItensSlidableWidget(
                  store: store,
                  index: index,
                );
              });
        });
  }
}
