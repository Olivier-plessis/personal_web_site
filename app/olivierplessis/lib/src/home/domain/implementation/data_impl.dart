import 'package:olivierplessis/src/home/domain/model/about/about_model.dart';
import 'package:olivierplessis/src/home/domain/model/contact/contact_model.dart';
import 'package:olivierplessis/src/home/domain/model/header/header_model.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';
import 'package:olivierplessis/src/navigation/domain/model/item_nav_model.dart';

abstract class IDataRepository {
  Future<List<Navigation>?> getNavigation();
  Future<HeaderSection> getHeaderSection();
  Future<AboutSection> getAboutSection();
  Future<PortfolioSection> getPortfolioSection();
  Future<ContactSection> getContactSection();
}
