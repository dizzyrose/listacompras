// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListStore on _ListStoreBase, Store {
  final _$txtItemDescriptionAtom =
      Atom(name: '_ListStoreBase.txtItemDescription');

  @override
  List<TextEditingController> get txtItemDescription {
    _$txtItemDescriptionAtom.reportRead();
    return super.txtItemDescription;
  }

  @override
  set txtItemDescription(List<TextEditingController> value) {
    _$txtItemDescriptionAtom.reportWrite(value, super.txtItemDescription, () {
      super.txtItemDescription = value;
    });
  }

  final _$colorCardAtom = Atom(name: '_ListStoreBase.colorCard');

  @override
  List<int> get colorCard {
    _$colorCardAtom.reportRead();
    return super.colorCard;
  }

  @override
  set colorCard(List<int> value) {
    _$colorCardAtom.reportWrite(value, super.colorCard, () {
      super.colorCard = value;
    });
  }

  final _$_ListStoreBaseActionController =
      ActionController(name: '_ListStoreBase');

  @override
  void updateList(int _itemIndex) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.updateList');
    try {
      return super.updateList(_itemIndex);
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
  dynamic changeColor(int _index, bool _lowOrHigh) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.changeColor');
    try {
      return super.changeColor(_index, _lowOrHigh);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
txtItemDescription: ${txtItemDescription},
colorCard: ${colorCard}
    ''';
  }
}
