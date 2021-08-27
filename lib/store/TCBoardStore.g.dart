// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TCBoardStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TCBoardStore on TCBoardStoreBase, Store {
  final _$personalBoardModelAtom = Atom(name: 'TCBoardStoreBase.personalBoardModel');

  @override
  ObservableList<PersonalBoardModel> get personalBoardModel {
    _$personalBoardModelAtom.reportRead();
    return super.personalBoardModel;
  }

  @override
  set personalBoardModel(ObservableList<PersonalBoardModel> value) {
    _$personalBoardModelAtom.reportWrite(value, super.personalBoardModel, () {
      super.personalBoardModel = value;
    });
  }

  final _$isStarredAtom = Atom(name: 'TCBoardStoreBase.isStarred');

  @override
  bool get isStarred {
    _$isStarredAtom.reportRead();
    return super.isStarred;
  }

  @override
  set isStarred(bool value) {
    _$isStarredAtom.reportWrite(value, super.isStarred, () {
      super.isStarred = value;
    });
  }

  final _$TCBoardStoreBaseActionController = ActionController(name: 'TCBoardStoreBase');

  @override
  void toggleStarred() {
    final _$actionInfo = _$TCBoardStoreBaseActionController.startAction(name: 'TCBoardStoreBase.toggleStarred');
    try {
      return super.toggleStarred();
    } finally {
      _$TCBoardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem(PersonalBoardModel data) {
    final _$actionInfo = _$TCBoardStoreBaseActionController.startAction(name: 'TCBoardStoreBase.addItem');
    try {
      return super.addItem(data);
    } finally {
      _$TCBoardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(PersonalBoardModel data) {
    final _$actionInfo = _$TCBoardStoreBaseActionController.startAction(name: 'TCBoardStoreBase.removeItem');
    try {
      return super.removeItem(data);
    } finally {
      _$TCBoardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
personalBoardModel: ${personalBoardModel},
isStarred: ${isStarred}
    ''';
  }
}
