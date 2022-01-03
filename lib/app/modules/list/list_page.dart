import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/domain/app-globals.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:flutter/material.dart';
import 'package:listadecompras/app/modules/list/widgets/list-itens-show-dialog-widget.dart';
import 'package:listadecompras/app/modules/list/widgets/list-itens-widget.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';

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
  ListPageState({Key? key, required this.listID});
  final String listID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF00BFA5),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/');
            listItensRecoverd = [];
          },
        ),
        title: Text(widget.title),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/src/images/main-screen.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              //   Text(listID),
              Container(
                  //  color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .7,
                  child: Expanded(
                      child: ListItensWidget(
                    listID: listID,
                  ))),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        //   tooltip: tipBtnCreateList,
        onPressed: () {
          //listItensRecoverd
          ListItensShowDialogWidget()
              .createNewList(context, listItensRecoverd, listID);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
