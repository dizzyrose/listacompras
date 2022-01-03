abstract class IListItensRepository {
  updateItem(List<String> _item, String _listID);
  readItem(String _listID);
  deleteItem();
}
