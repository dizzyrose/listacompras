abstract class IListItensRepository {
  updateItem(var listID, var itemID, var itemDescription, var itemColor);
  readItem(String listID);
  createItem(var itemID, var itemDescription, var itemColor);
  deleteItem(var listID, var itemID);
}
