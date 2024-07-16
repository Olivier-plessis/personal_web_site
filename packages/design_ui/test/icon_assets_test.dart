import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:design_ui/resources/resources.dart';

void main() {
  test('icon_assets assets test', () {
    expect(File(IconAssets.icGithub).existsSync(), isTrue);
    expect(File(IconAssets.icLinkedin).existsSync(), isTrue);
    expect(File(IconAssets.icLogo).existsSync(), isTrue);
    expect(File(IconAssets.icPlus).existsSync(), isTrue);
    expect(File(IconAssets.icTwitter).existsSync(), isTrue);
  });
}
