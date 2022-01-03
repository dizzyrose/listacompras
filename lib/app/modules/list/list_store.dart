import 'package:flutter/material.dart';
import 'package:listadecompras/app/domain/app-globals.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  int lowLightColor = 0xFFFFFFFF;
  int highLigthColor = 0xFF7BC043;

  @observable
  List<TextEditingController> txtItemDescription = [];

  @observable
  List<int> colorCard = [];

  @action
  void updateList(int _itemIndex) {
    listItensRecoverd.removeAt(_itemIndex);
  }

  @action
  setDefaultValues() {
    txtItemDescription = [];
    colorCard = [];
    for (int i = 0; i < listItensRecoverd.length; i++) {
      colorCard.add(lowLightColor);
      txtItemDescription.add(new TextEditingController());
    }
  }

  @action
  setInitValues() {
    for (int i = 0; i < listItensRecoverd.length; i++) {
      txtItemDescription[i].text = listItensRecoverd[i];
    }
  }

  @action
  changeColor(int _index, bool _lowOrHigh) {
    print(colorCard.length);

    if (_lowOrHigh) {
      colorCard.remove(_index);
      colorCard.insert(_index, lowLightColor);
    } else {
      colorCard.remove(_index);
      colorCard.insert(_index, highLigthColor);
    }
    print(colorCard.length);
  }
}
