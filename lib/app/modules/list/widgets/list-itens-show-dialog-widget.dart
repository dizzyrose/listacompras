import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';

class ListItensShowDialogWidget {
  TextEditingController titleListController = new TextEditingController();

  Future<void> createNewList(
      var context, List<String> _listItens, String _listID) async {
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
                        _listItens.add(titleListController.text);
                        Modular.to.pop();
                        ListItensRepository().updateItem(_listItens, _listID);
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
