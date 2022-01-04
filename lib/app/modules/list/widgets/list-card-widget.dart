import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';
import 'package:uuid/uuid.dart';

class CardWidget extends StatelessWidget {
  final ListStore store;
  final int index;
  final GlobalKey<FormState> formKey;
  CardWidget(
      {Key? key,
      required this.store,
      required this.index,
      required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Card(
              key: Key(Uuid().v1().toString()),
              color: store.colorCard[index],
              child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: UniqueKey(),
                  child: TextFormField(
                    autofocus: false,
                    controller: store.txtItemDescription[index],
                    onChanged: (value) {
                      store.updateItemDesciption(index, value);
                      ListItensRepository()
                          .updateItem(store.itemID, store.itemDescription);
                    },
                  )),
            ));
  }
}
