import 'package:crypto_scale_trade/component/add_plan_btn.dart';
import 'package:crypto_scale_trade/component/person_tile.dart';
import 'package:crypto_scale_trade/model/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScalePlanningScreen extends StatefulWidget{
  @override
  _ScalePlanning createState()=> _ScalePlanning();
}

class _ScalePlanning extends State<ScalePlanningScreen>{
  Widget _buildList(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      //padding: const EdgeInsets.only(top: 1.0),
      itemBuilder: (context, index) {
        return ListItem(index: index);
      },
    );
  }

  @override
  void dispose() {
    list.forEach((element) {
      element.myFocusNode.dispose();
      element.myController.dispose();
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.scale)),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  // onChanged: Provider.setVtvA,
                  decoration: const InputDecoration(
                    isDense: true,
                    hintText: '계획 1'
                  ),
                ),
              ),
              _buildList(context),
              // ListView.separated(
              //   // scrollDirection: Axis.vertical,
              //   physics: ClampingScrollPhysics(),
              //   shrinkWrap: true,
              //   padding: const EdgeInsets.all(8),
              //   itemCount: list.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return ListItem(index: index);
              //   }, separatorBuilder: (BuildContext context, int index) {
              //     return Divider();
              //   },
              // ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: AddPlanBtnWidget(),
              ),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      list.add(Item('new', FocusNode(), TextEditingController()));
                    });

                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      FocusScope.of(context)
                          .requestFocus(list[list.length - 1].myFocusNode);
                    });
                  },
                  child: Text('Add row'))
              ,
            ],
          )
        ),
      )
    );



  }

}

class Item {
  String textContent;
  FocusNode myFocusNode;
  TextEditingController myController;

  Item(this.textContent, this.myFocusNode, this.myController);
}
class ListItem extends StatefulWidget {
  int index = 0;

  ListItem({Key? key, required index}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  void initState() {
    super.initState();
    list[widget.index].myController.text = list[widget.index].textContent;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: list[widget.index].myFocusNode,
      controller: list[widget.index].myController,
      textInputAction: TextInputAction.go,
    );
  }
}
List<Item> list = [
  Item('one', FocusNode(), TextEditingController()),
  Item('two', FocusNode(), TextEditingController()),
  Item('three', FocusNode(), TextEditingController()),
  Item('four', FocusNode(), TextEditingController())
];
