import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/all_users_info_model.dart';

class AllUsersInfoController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  RxList<UsersInfoModel> usersInfo = RxList<UsersInfoModel>([]);

  @override
  void onInit() {
    super.onInit();
    collectionReference = firestore.collection('users');
    usersInfo.bindStream(getAllUsersInfo());
  }

  Stream<List<UsersInfoModel>> getAllUsersInfo() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => UsersInfoModel.fromMap(item)).toList());
}
