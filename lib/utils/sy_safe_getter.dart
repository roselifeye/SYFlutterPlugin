/// Save get function for:
/// String: If the value is NULL, return "",
/// int: If the value is NULL, return 0,
/// double: If the value is NULL, return 0.0,
/// bool: If the value is NULL, return false,
/// List: If the value is NULL, return [],
/// Map: If the value is NULL, return {}.
saveGetter<T>(T value) {
  T data = value;
  if (T is String) return (value==null) ? "" : value;
  if (T == int) return (value==null) ? 0 : value;
  if (T is double) return (value==null) ? 0.0 : value;
  if (T is bool) return (value==null) ? false : value;
  if (T is List) return ((value as List).length==0) ? [] : value;
  if (T is Map) return ((value as Map).length==0) ? {} : value;
  else return (value == null) ? {} : value;
}