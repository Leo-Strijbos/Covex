import 'package:covex/models/newUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covex/models/post.dart';
import 'package:covex/models/user.dart';


class userData {
  final String uid;

  userData({ this.uid });

  final CollectionReference userCollection = Firestore.instance.collection("userCollection");
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future updateUserData(
      String firstName,
      String lastName,
      String userName,
      List<User> followers,
      List<User> following,
      List<Post> recentPosts,
      List<Post> allPosts,
      ) async {
    return await userCollection.document(uid).setData({
      'firstName' : firstName,
      'lastName' : lastName,
      'userName' : userName,
    });
  }

  Future getData(String uid) async {
//    return await userCollection.document(uid).get();
    DocumentSnapshot _documentSnapshot = await userCollection.document(uid).get();
    userDatabase user = userDatabase.fromMap(_documentSnapshot.data);
    return user.toMap(user);
  }

  Future updateFollowers(User follower) async {
    return await userCollection.document(uid).collection('followers').document(follower.uid);
  }

  Future updateFollowing(User following) async {
    return await userCollection.document(uid).collection('following').document(following.uid);
  }

  Future addPosts(String imgUrl, String caption, String postOwnerUid, int likes, List<String> comments) async {

    return await userCollection.document(uid).collection('recentPosts').document(imgUrl).setData({
      'imgUrl' : imgUrl,
      'caption' : caption,
      'postOwnerUid' : postOwnerUid,
      'likes' : likes,
      'comments' : comments,
    });
  }

  Stream<QuerySnapshot> get data {
    return userCollection.snapshots();
  }

}

class usernameData {
  bool valid;
  dynamic result;


  Future<bool> usernameCheck(String username) async {
    final result = await Firestore.instance.collection('uNameCollection').where("username", isEqualTo: username).getDocuments();
    return result.documents.isEmpty;
  }


  Future addUserName(String uName, String uid) async {
    return await Firestore.instance.collection("uNameCollection").document(
        "$uid").setData({
      "username": "$uName"
    });
  }
}