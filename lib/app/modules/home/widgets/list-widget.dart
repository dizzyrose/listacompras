import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listadecompras/app/modules/home/widgets/slidable-widget.dart';
import 'package:listadecompras/app/repositories/list-repository.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: ListRepository().readList(),
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
                  String insertedAt = DateFormat('dd/MM/yyyy hh:MM:ss').format(
                      DateTime.fromMicrosecondsSinceEpoch(
                          doc.get("InsertedAt").microsecondsSinceEpoch));
                  return SlidebleWidget(
                    slideBleTitle:
                        doc.get('TituloDaLista') + " - " + insertedAt,
                    listID: doc.id,
                  );
                },
              ).toList(),
            );
          }
        },
      ),
    );
  }
}
