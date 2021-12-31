import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:flutter/material.dart';
import 'package:listadecompras/app/modules/list/widgets/list-itens-show-dialog-widget.dart';
import 'package:listadecompras/app/modules/list/widgets/list-itens-widget.dart';

class ListPage extends StatefulWidget {
  final String title;
  final String listID;

  const ListPage(
      {Key? key, this.title = 'Lista de Compras', required this.listID})
      : super(key: key);

  @override
  ListPageState createState() => ListPageState(listID: listID);
}

class ListPageState extends State<ListPage> {
  final ListStore store = Modular.get();

  ListPageState({Key? key, required this.listID});
  final String listID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text(listID),
          Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .8,
              child: Expanded(
                  child: ListItensWidget(
                listID: listID,
              )))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        //   tooltip: tipBtnCreateList,
        onPressed: () {
          Modular.to.navigate('/');
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
