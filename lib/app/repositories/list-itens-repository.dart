import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/repositories/interfaces/list-itens-interface-repository.dart';

class ListItensRepository implements IListItensRepository {
  @override
  createItem() {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  deleteItem() {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  readItem(String _listID) {
    return FirebaseFirestore.instance
        .collection("Usuarios")
        .doc(userMail)
        .collection('ListaDeCompras')
        .doc(_listID)
        .get();
  }

  @override
  updateItem() {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
