import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:design_ui/resources/resources.dart';

void main() {
  test('work_assets assets test', () {
    expect(File(WorkAssets.wrkProjetBrUnit).existsSync(), isTrue);
    expect(File(WorkAssets.wrkProjetCureety).existsSync(), isTrue);
    expect(File(WorkAssets.wrkProjetLpcr).existsSync(), isTrue);
    expect(File(WorkAssets.wrkProjetTada).existsSync(), isTrue);
  });
}
