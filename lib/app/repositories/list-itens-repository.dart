import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/repositories/interfaces/list-itens-interface-repository.dart';
import 'package:uuid/uuid.dart';

class ListItensRepository implements IListItensRepository {
  @override
  updateItem(List<String> _itens, String _listID) {
    FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(userMail)
        .collection('ListaDeCompras')
        .doc(_listID)
        .update({'ItensDaLista': _itens});
  }

  @override
  deleteItem() {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  readItem(String _listID) async {
    print(_listID);

    var collection = FirebaseFirestore.instance
        .collection("Usuarios")
        .doc(userMail)
        .collection('ListaDeCompras');
    var documentSnapshot = await collection.doc(_listID).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data = documentSnapshot.data();
      var value = data?['ItensDaLista'];
      return List<String>.from(value);
    } else {
      return [];
    }
  }
}
