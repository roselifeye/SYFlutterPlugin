/// Save get function for:
/// String: If the value is NULL, return "",
/// int: If the value is NULL, return 0,
/// double: If the value is NULL, return 0.0,
/// bool: If the value is NULL, return false,
/// List: If the value is NULL, return [],
/// Map: If the value is NULL, return {}.
saveGetter<T>(T value) {
  T data = value;
  if (T is String) return (data == null) ? "" : value;
  if (T == int) return (data == null) ? 0 : value;
  if (T is double) return (data == null) ? 0.0 : value;
  if (T is bool) return (data == null) ? false : value;
  if (T is List) return ((data as List).length == 0) ? [] : value;
  if (T is Map)
    return ((data as Map).length == 0) ? {} : value;
  else
    return (value == null) ? {} : T;
}
