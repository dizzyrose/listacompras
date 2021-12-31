import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listadecompras/app/modules/home/widgets/slidable-widget.dart';
import 'package:listadecompras/app/modules/list/widgets/list-itens-slidable-widget.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';
import 'package:listadecompras/app/repositories/list-repository.dart';

class ListItensWidget extends StatelessWidget {
  final String listID;

  ListItensWidget({Key? key, required this.listID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> listedItens = ListItensRepository().readItem(listID);
    return Container(
        child: ListView.builder(
            itemCount: listedItens.length,
            itemBuilder: (context, index) {
              print(listedItens[index]);
              return ListItensSlidebleWidget(
                itemDescription: listedItens[index],
                itemIndex: index,
              );
            }));
  }
}
