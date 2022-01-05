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
  ObservableList<TextEditingController>? txtItemDescription =
      ObservableList<TextEditingController>();

  @observable
  ObservableList<Color> colorCard = ObservableList<Color>();

  @action
  setItemID(var _itemID) {
    itemID = _itemID;
  }

  @action
  Future<bool> addItemDescription(var value) async {
    try {
      itemDescription.add(value);
      await ListItensRepository().updateItem(itemID, itemDescription);
      print("log --List item named: " +
          value +
          " add in the index: " +
          itemDescription.length.toString() +
          " size of itemDescription: " +
          itemDescription.length.toString());
      print("log--Index 0:" + itemDescription[0]);
      return true;
    } catch (e) {
      print("log -- additemdescription erro: " + e.toString());
      return false;
    }
  }

  @action
  removeItemDescription(var _index) async {
    try {
      var _oldValue = itemDescription[_index];
      itemDescription.removeAt(_index);
      await ListItensRepository().updateItem(itemID, itemDescription);
      print("log --List item index " +
          _index.toString() +
          " named: " +
          _oldValue +
          " removed" +
          " size of itemDescription: " +
          itemDescription.length.toString());
      return true;
    } catch (e) {
      print("log -- erro: " + e.toString());
      return false;
    }
  }

  @action
  updateAllItensDescription() async {
    try {
      for (int i = 0; i < itemDescription.length; i++) {
        itemDescription[i] = txtItemDescription![i].text;
      }
      print("log -- Total Elements: " + itemDescription.length.toString());
      await ListItensRepository().updateItem(itemID, itemDescription);
      return true;
    } catch (e) {
      print("log -- erro: " + e.toString());
      return false;
    }
  }

  @action
  updateItemDescription(var _index, var value) async {
    try {
      var _oldValue = itemDescription[_index];
      itemDescription.removeAt(_index);
      itemDescription.insert(_index, value);
      await ListItensRepository().updateItem(itemID, itemDescription);

      print("log --List item index " +
          _index.toString() +
          " named: " +
          _oldValue +
          " changed to: " +
          " size of itemDescription: " +
          itemDescription.length.toString() +
          itemDescription[_index]);
    } catch (e) {
      print("log -- updateitemdescription error : " + e.toString());
    }
  }

  @action
  getAllItemDescription() async {
    //itemDescription = ObservableList<String>.of(['a', 'b', 'c']);
    try {
      itemDescription = ObservableList<String>.of(
          await ListItensRepository().readItem(itemID));
      print("log --Recoverd Itens");

      for (int i = 0; i < itemDescription.length; i++) {
        print("log --Item index: " +
            i.toString() +
            " named: " +
            itemDescription[i]);
        colorCard.add(lowLightColor);
        txtItemDescription!.add(new TextEditingController());
        txtItemDescription![i].text = itemDescription[i];
      }
      return true;
    } catch (e) {
      print("log -- getallitemdescription error: " + e.toString());
      return false;
    }
  }

  @action
  updateTextFormField() {
    for (int i = 0; i < itemDescription.length; i++) {
      try {
        txtItemDescription![i].text = itemDescription[i];
        print("log -- Total Elements: " + itemDescription.length.toString());
        return true;
      } catch (e) {
        print("log -- updatetextformfield error: " + e.toString());
        return false;
      }
    }
  }

  @action
  changeColor(int _index) {
    try {
      print('log --received index: ' + _index.toString());
      print('log --length of elements: ' + colorCard.length.toString());

      print("log -------------------------");

      if (colorCard[_index] == lowLightColor) {
        print(
            "log --Card nº " + (_index + 1).toString() + "Mudar para Amarela");
        colorCard.removeAt(_index);
        colorCard.insert(_index, highLigthColor);
      } else {
        print("log --Card nº " + (_index + 1).toString() + "Mudar para Branca");
        colorCard.removeAt(_index);
        colorCard.insert(_index, lowLightColor);
      }
      return true;
    } catch (e) {
      print("log -- change color error: " + e.toString());
      return false;
    }
  }
}
