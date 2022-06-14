import '../utils/enums/bottom_bar_index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomBarProv = StateProvider<BottomBarIndex>(
  (_) => BottomBarIndex.values[0],
);
