// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListStore on _ListStoreBase, Store {
  final _$itemDescriptionAtom = Atom(name: '_ListStoreBase.itemDescription');

  @override
  ObservableList<String> get itemDescription {
    _$itemDescriptionAtom.reportRead();
    return super.itemDescription;
  }

  @override
  set itemDescription(ObservableList<String> value) {
    _$itemDescriptionAtom.reportWrite(value, super.itemDescription, () {
      super.itemDescription = value;
    });
  }

  final _$itemIndexAtom = Atom(name: '_ListStoreBase.itemIndex');

  @override
  ObservableList<int> get itemIndex {
    _$itemIndexAtom.reportRead();
    return super.itemIndex;
  }

  @override
  set itemIndex(ObservableList<int> value) {
    _$itemIndexAtom.reportWrite(value, super.itemIndex, () {
      super.itemIndex = value;
    });
  }

  final _$itemIDAtom = Atom(name: '_ListStoreBase.itemID');

  @override
  String get itemID {
    _$itemIDAtom.reportRead();
    return super.itemID;
  }

  @override
  set itemID(String value) {
    _$itemIDAtom.reportWrite(value, super.itemID, () {
      super.itemID = value;
    });
  }

  final _$lowLightColorAtom = Atom(name: '_ListStoreBase.lowLightColor');

  @override
  Color get lowLightColor {
    _$lowLightColorAtom.reportRead();
    return super.lowLightColor;
  }

  @override
  set lowLightColor(Color value) {
    _$lowLightColorAtom.reportWrite(value, super.lowLightColor, () {
      super.lowLightColor = value;
    });
  }

  final _$highLigthColorAtom = Atom(name: '_ListStoreBase.highLigthColor');

  @override
  MaterialColor get highLigthColor {
    _$highLigthColorAtom.reportRead();
    return super.highLigthColor;
  }

  @override
  set highLigthColor(MaterialColor value) {
    _$highLigthColorAtom.reportWrite(value, super.highLigthColor, () {
      super.highLigthColor = value;
    });
  }

  final _$txtItemDescriptionAtom =
      Atom(name: '_ListStoreBase.txtItemDescription');

  @override
  ObservableList<TextEditingController> get txtItemDescription {
    _$txtItemDescriptionAtom.reportRead();
    return super.txtItemDescription;
  }

  @override
  set txtItemDescription(ObservableList<TextEditingController> value) {
    _$txtItemDescriptionAtom.reportWrite(value, super.txtItemDescription, () {
      super.txtItemDescription = value;
    });
  }

  final _$colorCardAtom = Atom(name: '_ListStoreBase.colorCard');

  @override
  ObservableList<Color> get colorCard {
    _$colorCardAtom.reportRead();
    return super.colorCard;
  }

  @override
  set colorCard(ObservableList<Color> value) {
    _$colorCardAtom.reportWrite(value, super.colorCard, () {
      super.colorCard = value;
    });
  }

  final _$_ListStoreBaseActionController =
      ActionController(name: '_ListStoreBase');

  @override
  dynamic setItemIndex(dynamic _itemIndex) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setItemIndex');
    try {
      return super.setItemIndex(_itemIndex);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setItemID(dynamic _itemID) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setItemID');
    try {
      return super.setItemID(_itemID);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItemDescription(dynamic value) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.addItemDescription');
    try {
      return super.addItemDescription(value);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItemDescription(dynamic _index) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.removeItemDescription');
    try {
      return super.removeItemDescription(_index);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateItemDesciption(dynamic value, dynamic _index) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.updateItemDesciption');
    try {
      return super.updateItemDesciption(value, _index);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDefaultValues() {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setDefaultValues');
    try {
      return super.setDefaultValues();
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInitValues() {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setInitValues');
    try {
      return super.setInitValues();
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeColor(int _index) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.changeColor');
    try {
      return super.changeColor(_index);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemDescription: ${itemDescription},
itemIndex: ${itemIndex},
itemID: ${itemID},
lowLightColor: ${lowLightColor},
highLigthColor: ${highLigthColor},
txtItemDescription: ${txtItemDescription},
colorCard: ${colorCard}
    ''';
  }
}
