import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/enums/bottom_bar_index.dart';

final bottomBarProv = StateProvider<BottomBarIndex>(
  (_) => BottomBarIndex.values[0],
);
