extension ListExt on List {
  bool get notContainNull {
    bool result = true;
    for (var i in this) {
      if (i == null) {
        result = false;
      }
    }
    return result;
  }

  swapIndex(int swapIndex) {
    if (swapIndex != -1) {
      var item = this[swapIndex];
      removeAt(swapIndex);
      insert(0, item);
    }
  }

  removeNull() {
    removeWhere((element) => element == null);
  }

  get firstItem {
    try {
      return this[0];
    } catch (_) {
      return null;
    }
  }
}

extension NullSafetyListExt on List? {
  bool get isNullEmpty {
    if (this == null) {
      return true;
    } else {
      return this!.isEmpty;
    }
  }

  bool get isNotNullEmpty {
    return !isNullEmpty;
  }
}
