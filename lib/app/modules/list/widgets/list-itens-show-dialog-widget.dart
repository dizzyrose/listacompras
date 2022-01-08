import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';
import 'package:mobx/mobx.dart';

class ListItensShowDialogWidget {
  TextEditingController itemController = new TextEditingController();

  Future<void> createNewList(ListStore store, var context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Observer(
            builder: (context) => AlertDialog(
                  title: Text(createNewListItemTitle),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        new Text(listItemTitleText),
                        new TextFormField(
                          controller: itemController,
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
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            label: Text(listTitleTextCancel,
                                style: TextStyle(
                                    fontSize: 11,
                                    //   fontStyle: FontStyle.italic,
                                    color: Colors.white))),
                        Container(
                          width: MediaQuery.of(context).size.width / 6,
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              if (itemController.text.isNotEmpty) {
                                Modular.to.pop();
                                ListItensRepository().createItem(store.listID,
                                    itemController.text, "branco");

                                itemController.text = "";
                                print("something wrong if");
                              } else {
                                print("something wrong");
                              }
                            },
                            icon: Icon(Icons.save),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.blue),
                            label: Text(listTitleTextSave,
                                style: TextStyle(
                                    fontSize: 11,
                                    //   fontStyle: FontStyle.italic,
                                    color: Colors.white))),
                      ],
                    )
                  ],
                ));
      },
    );
  }
}
