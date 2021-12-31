import 'package:listadecompras/app/modules/list/list_Page.dart';
import 'package:listadecompras/app/modules/list/list_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ListStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:listID',
        child: (context, args) => ListPage(listID: args.params['listID'])),
  ];
}
