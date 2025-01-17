import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:design_ui/resources/resources.dart';

void main() {
  test('icon_assets assets test', () {
    expect(File(IconAssets.icAppstore).existsSync(), isTrue);
    expect(File(IconAssets.icGithub).existsSync(), isTrue);
    expect(File(IconAssets.icGoogleplay).existsSync(), isTrue);
    expect(File(IconAssets.icGreenLogo).existsSync(), isTrue);
    expect(File(IconAssets.icLinkedin).existsSync(), isTrue);
    expect(File(IconAssets.icPlus).existsSync(), isTrue);
    expect(File(IconAssets.icTwitter).existsSync(), isTrue);
  });
}
