import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:design_ui/resources/resources.dart';

void main() {
  test('work_assets assets test', () {
    expect(File(WorkAssets.wrkBrUnitsBanner).existsSync(), isTrue);
    expect(File(WorkAssets.wrkBrUnitsLogo).existsSync(), isTrue);
    expect(File(WorkAssets.wrkCureetyLogo).existsSync(), isTrue);
    expect(File(WorkAssets.wrkLaMobileryLogo).existsSync(), isTrue);
    expect(File(WorkAssets.wrkLisaBanner).existsSync(), isTrue);
    expect(File(WorkAssets.wrkLisaLogo).existsSync(), isTrue);
    expect(File(WorkAssets.wrkLpcrBanner).existsSync(), isTrue);
    expect(File(WorkAssets.wrkLpcrLogo).existsSync(), isTrue);
    expect(File(WorkAssets.wrkProjetCureety).existsSync(), isTrue);
    expect(File(WorkAssets.wrkSublimLogo).existsSync(), isTrue);
    expect(File(WorkAssets.wrkTadaBanner).existsSync(), isTrue);
    expect(File(WorkAssets.wrkTadaLogo).existsSync(), isTrue);
  });
}
