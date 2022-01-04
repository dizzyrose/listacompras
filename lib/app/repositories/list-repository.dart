import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:uuid/uuid.dart';
import 'package:listadecompras/app/repositories/interfaces/list-interface-repository.dart';

class ListRepository implements IListRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  createList(String _listName) {
    firestore
        .collection('Usuarios')
        .doc(userMail)
        .collection('ListaDeCompras')
        .doc(Uuid().v1())
        .set({
      'InsertedAt': DateTime.now(),
      'CreatedBy': userMail,
      'TituloDaLista': _listName,
      'ItensDaLista': []
    });
  }

  @override
  deleteList(String _listID) {
    FirebaseFirestore.instance
        .collection("Usuarios")
        .doc(userMail)
        .collection('ListaDeCompras')
        .doc(_listID)
        .delete();
  }

  @override
  readList() {
    return FirebaseFirestore.instance
        .collection("Usuarios")
        .doc(userMail)
        .collection('ListaDeCompras')
        .where('CreatedBy', isEqualTo: userMail)
        .snapshots();
  }

  @override
  updateList() {
    // TODO: implement updateList
  }
}
