import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:design_ui/resources/resources.dart';

void main() {
  test('branding_assets assets test', () {
    expect(File(BrandingAssets.bdgContact).existsSync(), isTrue);
    expect(File(BrandingAssets.bdgHeaderBranding).existsSync(), isTrue);
    expect(File(BrandingAssets.bdgPhoto).existsSync(), isTrue);
  });
}
