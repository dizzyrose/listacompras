import 'package:listadecompras/app/modules/list/list_store.dart';

abstract class IListItensRepository {
  updateItem(var itemID, var itemDescription);
  readItem(String _listID);
  deleteItem();
}
