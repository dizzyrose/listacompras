import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:mobx/mobx.dart';

class ListItensShowDialogWidget {
  TextEditingController titleListController = new TextEditingController();

  Future<void> createNewList(ListStore store, var context) async {
    return showDialog<void>(
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
                    onPressed: () async {
                      try {
                        if (titleListController.text.isNotEmpty) {
                          Navigator.of(context).pop();
                          var oldValue = store.itemDescription.length;
                          bool addItem = await store
                              .addItemDescription(titleListController.text);
                          bool getAllItens =
                              await store.getAllItemDescription();
                          bool updateAllItens =
                              await store.updateAllItensDescription();

                          // await store.updateTextFormField();
                          await asyncWhen(
                              (_) => addItem && getAllItens && updateAllItens);
                          // (_) => addItem && updateAllItens);
                          print("log --: old size: " +
                              oldValue.toString() +
                              " new size: " +
                              store.itemDescription.length.toString());
                        }
                      } catch (e) {
                        print("log -- error on add item: " + e.toString());
                      }
                    },
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
      },
    );
  }
}
