import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/modules/home/home_store.dart';
import 'package:listadecompras/app/modules/home/widgets/list-widget.dart';
import 'package:listadecompras/app/modules/home/widgets/show-dialog-widget.dart';
import 'package:listadecompras/app/modules/home/widgets/slidable-widget.dart';
import 'package:listadecompras/app/repositories/list-repository.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(titleHomePage),
      ),
      body: Column(
        children: [
          Container(
              //  color: Colors.red,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .8,
              child: Expanded(child: ListWidget()))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: tipBtnCreateList,
        onPressed: () {
          ShowDialogWidget().createNewList(context);
//          ListRepository().createList();
          //Modular.to.navigate('/list/');
          // store.increment();
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
