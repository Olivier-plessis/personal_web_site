enum socialNetworkEnum { linkedin, github, twitter }

extension socialNetworkExtension on socialNetworkEnum {
  String get name {
    switch (this) {
      case socialNetworkEnum.linkedin:
        return 'assets/images/icons/linkedin.svg';
      case socialNetworkEnum.github:
        return 'assets/images/icons/github.svg';
      case socialNetworkEnum.twitter:
        return 'assets/images/icons/twitter.svg';
    }
  }
}
