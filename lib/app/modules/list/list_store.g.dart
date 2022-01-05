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
  ObservableList<TextEditingController>? get txtItemDescription {
    _$txtItemDescriptionAtom.reportRead();
    return super.txtItemDescription;
  }

  @override
  set txtItemDescription(ObservableList<TextEditingController>? value) {
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

  final _$addItemDescriptionAsyncAction =
      AsyncAction('_ListStoreBase.addItemDescription');

  @override
  Future<bool> addItemDescription(dynamic value) {
    return _$addItemDescriptionAsyncAction
        .run(() => super.addItemDescription(value));
  }

  final _$removeItemDescriptionAsyncAction =
      AsyncAction('_ListStoreBase.removeItemDescription');

  @override
  Future removeItemDescription(dynamic _index) {
    return _$removeItemDescriptionAsyncAction
        .run(() => super.removeItemDescription(_index));
  }

  final _$updateAllItensDescriptionAsyncAction =
      AsyncAction('_ListStoreBase.updateAllItensDescription');

  @override
  Future updateAllItensDescription() {
    return _$updateAllItensDescriptionAsyncAction
        .run(() => super.updateAllItensDescription());
  }

  final _$updateItemDescriptionAsyncAction =
      AsyncAction('_ListStoreBase.updateItemDescription');

  @override
  Future updateItemDescription(dynamic _index, dynamic value) {
    return _$updateItemDescriptionAsyncAction
        .run(() => super.updateItemDescription(_index, value));
  }

  final _$getAllItemDescriptionAsyncAction =
      AsyncAction('_ListStoreBase.getAllItemDescription');

  @override
  Future getAllItemDescription() {
    return _$getAllItemDescriptionAsyncAction
        .run(() => super.getAllItemDescription());
  }

  final _$_ListStoreBaseActionController =
      ActionController(name: '_ListStoreBase');

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
  dynamic updateTextFormField() {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.updateTextFormField');
    try {
      return super.updateTextFormField();
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
itemID: ${itemID},
lowLightColor: ${lowLightColor},
highLigthColor: ${highLigthColor},
txtItemDescription: ${txtItemDescription},
colorCard: ${colorCard}
    ''';
  }
}
