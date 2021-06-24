class Converter {
  static List<String> convertListToListOfString(List<dynamic> list) {
    List<String> result = [];
    for (var item in list) {
      result.add(item.toString());
    }
    return result;
  }
}
