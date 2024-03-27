
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:market3t/services/appwrite.dart';
import 'package:market3t/shared/constants/appwrite_constants.dart';

class CategoryProvider {
  Account? account;
  Storage? storage;
  Databases? databases;

  CategoryProvider() {
    account = Account(Appwrite.instance.client);
    storage = Storage(Appwrite.instance.client);
    databases = Databases(Appwrite.instance.client);
  }

  
  Future<models.DocumentList> getCategory() async {
    final response = await databases!.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.categoryCollectionId);

    return response;
  }

  Future<models.DocumentList> getCategoryPrice() async {
    final response = await databases!.listDocuments(
      databaseId: AppWriteConstants.databaseId,
      collectionId: AppWriteConstants.categoryPriceCollectionId
    );
    return response;
  }

}
