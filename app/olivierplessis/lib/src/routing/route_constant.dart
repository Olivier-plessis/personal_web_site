enum AppPage {
  landing,
  home,
  portfolio,
}

extension AppPageExtension on AppPage {
  String get routePath {
    return switch (this) {
      AppPage.landing => '/',
      AppPage.home => '/accueil',
      AppPage.portfolio => '/portfolio',
    };
  }

  String get routeName {
    return switch (this) {
      AppPage.landing => 'LANDING',
      AppPage.home => 'HOME',
      AppPage.portfolio => 'PORTFOLIO',
    };
  }
}
