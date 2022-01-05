import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key, required this.index, required this.store})
      : super(key: key);
  final ListStore store;
  final int index;

  @override
  CardWidgetState createState() => CardWidgetState(index: index, store: store);
}

class CardWidgetState extends ModularState<CardWidget, ListStore> {
  final ListStore store;
  final int index;

  CardWidgetState({
    Key? key,
    required this.store,
    required this.index,
  });

  @override
  void initState() {
    if (index == store.itemDescription.length) {
      print("Mierda");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //if(index<store.itemDescription)
    return Observer(
        builder: (context) => Card(
              key: UniqueKey(),
              color: store.colorCard[index],
              child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: UniqueKey(),
                  child: TextFormField(
                    autofocus: false,
                    controller: store.txtItemDescription![index],
                    onTap: () {
                      store.updateAllItensDescription();
                    },
                    onChanged: (value) async {
                      //  isChanged = true;
                      //  await store.updateItemDesciption(index, value);
                    },
                    onFieldSubmitted: (value) async =>
                        store.updateAllItensDescription(),
                  )),
            ));
  }
}
