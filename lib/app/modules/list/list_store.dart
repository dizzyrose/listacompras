import 'package:flutter/material.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  @observable
  ObservableList<String> itemDescription = ObservableList<String>();

  @observable
  ObservableList<int> itemIndex = ObservableList<int>();

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
  setItemIndex(var _itemIndex) {
    itemIndex.add(_itemIndex);
  }

  @action
  setItemID(var _itemID) {
    itemID = _itemID;
  }

  @action
  addItemDescription(var value) {
    itemDescription.add(value);
    ListItensRepository().updateItem(itemID, itemDescription);
  }

  @action
  removeItemDescription(var _index) {
    itemDescription.removeAt(itemIndex[_index]);
    ListItensRepository().updateItem(itemID, itemDescription);
  }

  @action
  updateItemDesciption(var value, var _index) {
    itemDescription.removeAt(itemIndex[_index]);
    itemDescription.insert(itemIndex[_index], value);
    ListItensRepository().updateItem(itemID, itemDescription);
  }

  @action
  setDefaultValues() {
    txtItemDescription = ObservableList<TextEditingController>();
    colorCard = ObservableList<Color>();
    for (int i = 0; i < itemDescription.length; i++) {
      colorCard.add(lowLightColor);
      txtItemDescription.add(new TextEditingController());
    }
  }

  @action
  setInitValues() {
    for (int i = 0; i < itemDescription.length; i++) {
      txtItemDescription[i].text = itemDescription[i];
    }
  }

  @action
  changeColor(int _index) {
    print('received index: ' + _index.toString());
    print('length of elements: ' + colorCard.length.toString());

    print("-----------------------");

    if (colorCard[_index] == lowLightColor) {
      print("Card nº " + (_index + 1).toString() + "Mudar para Amarela");
      colorCard.removeAt(_index);
      colorCard.insert(_index, highLigthColor);
    } else {
      print("Card nº " + (_index + 1).toString() + "Mudar para Branca");
      colorCard.removeAt(_index);
      colorCard.insert(_index, lowLightColor);
    }
  }
}
