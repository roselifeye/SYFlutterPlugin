import 'dart:html';

import 'package:sy_flutter_plugin/utils/ios_class_style/y_range.dart';

import '../sy_safe_getter.dart';

class Array<T> {
  List _list = new List<T>();

  Array();

  void add<T>(T value) {
    this._list.add(saveGetter(value));
  }

  void addObjectsFromArray(List<T> value) {
    this._list.addAll(saveGetter(value));
  }

  void insertObject<T>(T value) {
    if (value != null) this._list.add(saveGetter(value));
  }

  void insertObjectWithIndexes(List<T> value, YRange()) {

  }

  get value {
    return this._list;
  }
}
