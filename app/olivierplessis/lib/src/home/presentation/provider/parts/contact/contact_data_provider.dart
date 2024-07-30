import 'package:olivierplessis/src/home/data/repository/data_repository.dart';
import 'package:olivierplessis/src/home/domain/model/contact/contact_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_data_provider.g.dart';

@Riverpod(keepAlive: true)
class ContactDataClient extends _$ContactDataClient {
  @override
  Future<DataRepository> build() async {
    return DataRepository();
  }
}

@Riverpod(keepAlive: true)
class ContactData extends _$ContactData {
  @override
  FutureOr<ContactSection> build() async {
    final contactSection = await ref.watch(contactDataClientProvider.future);

    return contactSection.getContactSection();
  }
}
