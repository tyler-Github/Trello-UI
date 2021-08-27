// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TCStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TCStore on TCStoreBase, Store {
  final _$isOptionVisibleAtom = Atom(name: 'TCStoreBase.isOptionVisible');

  @override
  bool get isOptionVisible {
    _$isOptionVisibleAtom.reportRead();
    return super.isOptionVisible;
  }

  @override
  set isOptionVisible(bool value) {
    _$isOptionVisibleAtom.reportWrite(value, super.isOptionVisible, () {
      super.isOptionVisible = value;
    });
  }

  final _$toggleFABOptionAsyncAction = AsyncAction('TCStoreBase.toggleFABOption');

  @override
  Future<void> toggleFABOption() {
    return _$toggleFABOptionAsyncAction.run(() => super.toggleFABOption());
  }

  @override
  String toString() {
    return '''
isOptionVisible: ${isOptionVisible}
    ''';
  }
}
