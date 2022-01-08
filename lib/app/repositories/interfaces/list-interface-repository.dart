abstract class IListRepository {
  createList(String _listTitle, String _listColor);
  readList();
  updateList(String _listName);
  deleteList(String _listID);
}
