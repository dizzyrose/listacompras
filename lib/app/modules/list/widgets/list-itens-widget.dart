import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:listadecompras/app/domain/app-globals.dart';
import 'package:listadecompras/app/modules/home/widgets/slidable-widget.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:listadecompras/app/modules/list/widgets/list-itens-slidable-widget.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';
import 'package:listadecompras/app/repositories/list-repository.dart';

class ListItensWidget extends StatelessWidget {
  final String listID;

  ListItensWidget({Key? key, required this.listID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: ListItensRepository().readItem(listID),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.none &&
              // ignore: unnecessary_null_comparison
              snap.hasData == null) {
            return CircularProgressIndicator();
          }

          return ListView.builder(
              itemCount: snap.data?.length,
              itemBuilder: (context, index) {
                String _itemDescription = snap.data![index];
                listItensRecoverd = List<String>.from(snap.data!);
                return ListItensSlidableWidget(
                  itemDescription: _itemDescription,
                  itemIndex: index,
                  itemID: listID,
                  itemColor: 0,
                );
              });
        });
  }

  listViwerWidget() async {
    // print(listedItens[1]);
  }
}
