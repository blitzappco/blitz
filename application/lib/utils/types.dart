import 'package:blitz/utils/vars.dart';

String processTypes(List<String> types) {
  for (int i = 0; i < types.length; i++) {
    if (mapPlaceIcons.containsKey(types[i])) {
      return types[i];
    }
  }

  return 'general';
}
