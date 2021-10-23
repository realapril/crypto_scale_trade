import 'package:crypto_scale_trade/component/add_plan_list.dart';
import 'package:crypto_scale_trade/component/person_tile.dart';
import 'package:crypto_scale_trade/model/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScalePlanningScreen extends StatefulWidget{
  @override
  _ScalePlanning createState()=> _ScalePlanning();
}

class _ScalePlanning extends State<ScalePlanningScreen>{
  Widget column = Expanded(
    child: Column(
      // align the text to the left instead of centered
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(Icons.computer),
            title: Text("Title"),
            subtitle: Text("SubTitle"),
          ),
        )
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    List<Person> people = <Person>[Person(11, "A", false), Person(12, "B", false),Person(11, "A", false), Person(12, "B", false),Person(11, "A", false), Person(12, "B", false),Person(11, "A", false), Person(12, "B", false),Person(11, "A", false), Person(12, "B", false),Person(11, "A", false), Person(12, "B", false),Person(11, "A", false), Person(12, "B", false),Person(11, "A", false), Person(12, "B", false),Person(11, "A", false), Person(12, "B", false),Person(11, "A", false), Person(12, "B", false),Person(11, "A", false), Person(12, "B", false)];
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
              ListView.builder(
                // scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: people.length,
                itemBuilder: (BuildContext context, int index) {
                  return PersonTile(people[index]);
                },
              ),
              // ListView.builder(
              // // ListView.separated(
              // //   itemCount: ,
              //   itemBuilder: (context, index) {
              //     // var item = items[index];
              //     return Card(
              //       child: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Column(
              //           children: <Widget>[
              //             column,
              //             column,
              //             column,
              //           ],
              //         ),
              //       ),
              //     );
              //
              //   },
              //   // separatorBuilder: (BuildContext context, int index){
              //   //   return Divider();
              //   // },
              // ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: AddPlanListWidget(),
              ),
            ],
          )
        ),
      )
    );
  }

}