enum AppPage {
  landing,
  home,
  portfolio,
  legal,
}

extension AppPageExtension on AppPage {
  String get routePath {
    return switch (this) {
      AppPage.landing => '/landing',
      AppPage.home => '/',
      AppPage.portfolio => '/portfolio',
      AppPage.legal => '/legal',
    };
  }

  String get routeName {
    return switch (this) {
      AppPage.landing => 'LANDING',
      AppPage.home => 'HOME',
      AppPage.portfolio => 'PORTFOLIO',
      AppPage.legal => 'LEGAL',
    };
  }
}
