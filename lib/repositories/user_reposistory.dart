import 'package:appwrite/models.dart';
import 'package:market3t/models/user/user_model.dart';
import 'package:market3t/providers/user_provider.dart';

class UserRepository {
  UserProvider userProvider;
  UserRepository(this.userProvider);

  // Future<void> updateName(String name) async {
  //   await userProvider.updateName(name);
  // }

  Future<UserModel> getUserData(uuid) async {
    final response = await userProvider.getUserData(uuid);
    return response;
  }
  Future<Document> updateUserData(uuid, Map map) async {
    final response = await userProvider.updateUserData(uuid, map);
    return response;
  }
}