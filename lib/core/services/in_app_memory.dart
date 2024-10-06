class InAppMemory {
  final Map<String, dynamic> _storage = {};

  void write<T>(String key, T data) {
    _storage[key] = data;
  }

  dynamic read(String key) {
    if (hasKey(key)) {
      return _storage[key];
    }
    return null;
  }

  bool hasKey(String key) {
    return _storage.containsKey(key);
  }

  void remove(String key) {
    if (hasKey(key)) {
      _storage.remove(key);
    }
  }

  void removeAll() {
    _storage.clear();
  }
}
