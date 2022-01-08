import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listadecompras/app/domain/app-constants.dart';
import 'package:listadecompras/app/modules/home/home_store.dart';
import 'package:listadecompras/app/modules/home/widgets/list-widget.dart';
import 'package:listadecompras/app/modules/home/widgets/show-dialog-widget.dart';

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
        title: Text(
          titleHomePage.toUpperCase(),
          style: TextStyle(color: Colors.white),
          // textAlign: TextAlignVertical(),
        ),
        backgroundColor: Color(0xFF00BFA5),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/src/images/main-screen.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [Expanded(child: ListWidget())],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: tipBtnCreateList,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
