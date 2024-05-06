
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:market3t/services/appwrite.dart';
import 'package:market3t/shared/constants/appwrite_constants.dart';

class InfomationProvider {
  Account? account;
  Storage? storage;
  Databases? databases;

  InfomationProvider() {
    account = Account(Appwrite.instance.client);
    storage = Storage(Appwrite.instance.client);
    databases = Databases(Appwrite.instance.client);
  }

  
    Future<models.Document> getMainInfomationSetting() async {
      final response = await databases!.getDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.settingInformationCollection,
          documentId: "main_infomation"
      );
      return response;

  }

  Future<models.DocumentList> getInfomationSetting() async {
    final response = await databases!.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.settingInformationCollection,
    );
    return response;
  }
}
