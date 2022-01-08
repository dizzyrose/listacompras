import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:flutter/material.dart';
import 'package:listadecompras/app/modules/list/widgets/list-itens-show-dialog-widget.dart';
import 'package:listadecompras/app/modules/list/widgets/list-itens-widget.dart';
import 'package:mobx/mobx.dart';

class ListPage extends StatefulWidget {
  final String title;
  final String listID;

  const ListPage(
      {Key? key, this.title = 'Lista de Compras', required this.listID})
      : super(key: key);

  @override
  ListPageState createState() => ListPageState(listID: listID);
}

class ListPageState extends ModularState<ListPage, ListStore> {
  ListPageState({Key? key, required this.listID});
  final String listID;
  ListStore store = Modular.get();
  TextEditingController titleListController = new TextEditingController();

  @override
  void initState() {
    print(listID);
    store.setlistID(listID);
    //  store.itemDescription = ObservableList<String>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF00BFA5),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/');
          },
        ),
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/src/images/main-screen.png'),
                fit: BoxFit.cover)),
        child: Container(
            //  color: Colors.red,
            //  width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * .7,
            child: Column(
          children: [
            Expanded(child: ListItensWidget(store: store)),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        //   tooltip: tipBtnCreateList,
        onPressed: () {
          ListItensShowDialogWidget().createNewList(store, context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }

  Future<void> createNewList(var context) async {
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(createNewListItemTitle),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  new Text(listItemTitleText),
                  new TextFormField(
                    controller: titleListController,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              new Row(
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        Modular.to.pop();
                      },
                      icon: Icon(Icons.cancel),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      label: Text(listTitleTextCancel,
                          style: TextStyle(
                              fontSize: 11,
                              //   fontStyle: FontStyle.italic,
                              color: Colors.white))),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.save),
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      label: Text(listTitleTextSave,
                          style: TextStyle(
                              fontSize: 11,
                              //   fontStyle: FontStyle.italic,
                              color: Colors.white))),
                ],
              )
            ],
          );
        });
  }
}
