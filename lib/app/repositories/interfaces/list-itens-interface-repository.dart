abstract class IListItensRepository {
  createItem(List<String> _item, String _listID);
  readItem(String _listID);
  updateItem();
  deleteItem();
}
