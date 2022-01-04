import 'package:flutter/material.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  @observable
  ObservableList<String> itemDescription = ObservableList<String>();

  @observable
  String itemID = "";

  @observable
  var lowLightColor = Colors.white;

  @observable
  var highLigthColor = Colors.yellow;

  @observable
  ObservableList<TextEditingController> txtItemDescription =
      ObservableList<TextEditingController>();

  @observable
  ObservableList<Color> colorCard = ObservableList<Color>();

  @action
  setItemID(var _itemID) {
    itemID = _itemID;
  }

  @action
  addItemDescription(var value) {
    itemDescription.add(value);
    ListItensRepository().updateItem(itemID, itemDescription);
    print("log --List item named: " +
        value +
        " add in te index: " +
        itemDescription.length.toString());
    print("log--Index 0:" + itemDescription[0]);
  }

  @action
  removeItemDescription(var _index) {
    var _oldValue = itemDescription[_index];
    itemDescription.removeAt(_index);
    ListItensRepository().updateItem(itemID, itemDescription);
    print("log --List item index " +
        _index.toString() +
        " named: " +
        _oldValue +
        " removed");
  }

  @action
  updateItemDesciption(var _index, var value) {
    var _oldValue = itemDescription[_index];
    itemDescription.removeAt(_index);
    itemDescription.insert(_index, value);

    print("log --List item index " +
        _index.toString() +
        " named: " +
        _oldValue +
        " changed to: " +
        itemDescription[_index]);
  }

  @action
  getAllItemDescription() async {
    //itemDescription = ObservableList<String>.of(['a', 'b', 'c']);
    itemDescription =
        ObservableList<String>.of(await ListItensRepository().readItem(itemID));
    print("log --Recoverd Itens");

    for (int i = 0; i < itemDescription.length; i++) {
      print("log --Item index: " +
          i.toString() +
          " named: " +
          itemDescription[i]);
      colorCard.add(lowLightColor);
      txtItemDescription.add(new TextEditingController());
      txtItemDescription[i].text = itemDescription[i];
    }
  }

  @action
  updateTextFormField() {
    for (int i = 0; i < itemDescription.length; i++) {
      txtItemDescription[i].text = itemDescription[i];
    }
  }

  @action
  changeColor(int _index) {
    print('log --received index: ' + _index.toString());
    print('log --length of elements: ' + colorCard.length.toString());

    print("log -------------------------");

    if (colorCard[_index] == lowLightColor) {
      print("log --Card nº " + (_index + 1).toString() + "Mudar para Amarela");
      colorCard.removeAt(_index);
      colorCard.insert(_index, highLigthColor);
    } else {
      print("log --Card nº " + (_index + 1).toString() + "Mudar para Branca");
      colorCard.removeAt(_index);
      colorCard.insert(_index, lowLightColor);
    }
  }
}
