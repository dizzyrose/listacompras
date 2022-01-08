import 'package:flutter/material.dart';
import 'package:listadecompras/app/repositories/list-itens-repository.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  @observable
  ObservableList<String> itemDescription = ObservableList<String>();

  @observable
  int index = -1;

  @observable
  String listID = "";

  @observable
  List<String> itemID = [];

  @observable
  String itemColor = "";

  @observable
  var lowLightColor = Colors.white;

  @observable
  var highLigthColor = Colors.yellow;

  @observable
  String txtItemDescription = "";

  @observable
  ObservableList<Color> colorCard = ObservableList<Color>();

  @action
  incrementIndex() {
    index++;
  }

  @action
  setTextItem(var _txtItemDescription) {
    txtItemDescription = _txtItemDescription;
  }

  @action
  setlistID(var _listID) {
    listID = _listID;
  }

  @action
  setitemID(var _itemID) {
    itemID.add(_itemID);
  }

  @action
  setColor(var _itemColor) {
    itemColor = _itemColor;
  }
}
