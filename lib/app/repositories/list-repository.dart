import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:uuid/uuid.dart';
import 'package:listadecompras/app/repositories/interfaces/list-interface-repository.dart';

class ListRepository implements IListRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  createList(String _listTitle, String _listColor) {
    firestore
        .collection('Users')
        .doc(userMail)
        .collection('List')
        .doc(Uuid().v1())
        .set({
      'InsertedAt': DateTime.now(),
      'CreatedBy': userMail,
      'ListTitle': _listTitle,
      'TitleColor': _listColor
    });
  }

  @override
  deleteList(String _listID) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(userMail)
        .collection('List')
        .doc(_listID)
        .delete();
  }

  @override
  readList() {
    return FirebaseFirestore.instance
        .collection("Users")
        .doc(userMail)
        .collection('List')
        .where('CreatedBy', isEqualTo: userMail)
        .snapshots();
  }

  @override
  updateList(String _listName) {
    firestore
        .collection('Usuarios')
        .doc(userMail)
        .collection('ListaDeCompras')
        .doc(Uuid().v1())
        .update({
      'TituloDaLista': _listName,
    });
  }
}
