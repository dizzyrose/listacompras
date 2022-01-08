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

  final _$indexAtom = Atom(name: '_ListStoreBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$listIDAtom = Atom(name: '_ListStoreBase.listID');

  @override
  String get listID {
    _$listIDAtom.reportRead();
    return super.listID;
  }

  @override
  set listID(String value) {
    _$listIDAtom.reportWrite(value, super.listID, () {
      super.listID = value;
    });
  }

  final _$itemIDAtom = Atom(name: '_ListStoreBase.itemID');

  @override
  List<String> get itemID {
    _$itemIDAtom.reportRead();
    return super.itemID;
  }

  @override
  set itemID(List<String> value) {
    _$itemIDAtom.reportWrite(value, super.itemID, () {
      super.itemID = value;
    });
  }

  final _$itemColorAtom = Atom(name: '_ListStoreBase.itemColor');

  @override
  String get itemColor {
    _$itemColorAtom.reportRead();
    return super.itemColor;
  }

  @override
  set itemColor(String value) {
    _$itemColorAtom.reportWrite(value, super.itemColor, () {
      super.itemColor = value;
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
  String get txtItemDescription {
    _$txtItemDescriptionAtom.reportRead();
    return super.txtItemDescription;
  }

  @override
  set txtItemDescription(String value) {
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
  dynamic incrementIndex() {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.incrementIndex');
    try {
      return super.incrementIndex();
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTextItem(dynamic _txtItemDescription) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setTextItem');
    try {
      return super.setTextItem(_txtItemDescription);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setlistID(dynamic _listID) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setlistID');
    try {
      return super.setlistID(_listID);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setitemID(dynamic _itemID) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setitemID');
    try {
      return super.setitemID(_itemID);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setColor(dynamic _itemColor) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setColor');
    try {
      return super.setColor(_itemColor);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemDescription: ${itemDescription},
index: ${index},
listID: ${listID},
itemID: ${itemID},
itemColor: ${itemColor},
lowLightColor: ${lowLightColor},
highLigthColor: ${highLigthColor},
txtItemDescription: ${txtItemDescription},
colorCard: ${colorCard}
    ''';
  }
}
