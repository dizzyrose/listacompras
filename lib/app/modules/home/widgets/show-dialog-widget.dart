import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/repositories/list-repository.dart';

class ShowDialogWidget {
  TextEditingController titleListController = new TextEditingController();

  Future<void> createNewList(var context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(createNewListTitle),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                new Text(listTitleText),
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
                        ListRepository()
                            .createList(titleListController.text, "branco");
                      } else {}
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
