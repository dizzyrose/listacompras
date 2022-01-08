import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/repositories/interfaces/list-itens-interface-repository.dart';
import 'package:uuid/uuid.dart';

class ListItensRepository implements IListItensRepository {
  @override
  updateItem(var listID, var itemID, var itemDescription, var itemColor) {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(userMail)
        .collection('List')
        .doc(listID)
        .collection('Itens')
        .doc(itemID)
        .update({
      'Item': itemDescription,
      'ItemColor:': itemColor,
      'UpdatedAt': DateTime.now(),
    });
  }

  @override
  createItem(var listID, var itemDescription, var itemColor) {
    try {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(userMail)
          .collection('List')
          .doc(listID)
          .collection('Itens')
          .doc(Uuid().v1())
          .set({
        'Item': itemDescription,
        'ItemColor': itemColor,
        'insertedAt': DateTime.now(),
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  readItem(String listID) {
    return FirebaseFirestore.instance
        .collection("Users")
        .doc(userMail)
        .collection('List')
        .doc(listID)
        .collection('Itens')
        .where('Item', isNotEqualTo: "")
        .snapshots();
  }

  @override
  deleteItem(var listID, var itemID) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(userMail)
        .collection('List')
        .doc(listID)
        .collection('Itens')
        .doc(itemID)
        .delete();
  }
}
