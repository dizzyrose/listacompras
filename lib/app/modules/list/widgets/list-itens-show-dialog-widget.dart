import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';

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
                    onPressed: () {
                      if (titleListController.text.isNotEmpty) {
                        Modular.to.pop();
                        store.addItemDescription(titleListController.text);
                        store.updateTextFormField();
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
