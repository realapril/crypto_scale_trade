import 'package:crypto_scale_trade/component/add_plan_btn.dart';
import 'package:crypto_scale_trade/component/person_tile.dart';
import 'package:crypto_scale_trade/component/plan_list_view.dart';
import 'package:crypto_scale_trade/model/scale_trading_plan.dart';
import 'package:crypto_scale_trade/model/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class SavedListScreen extends StatefulWidget {
//   const SavedListScreen({Key? key}) : super(key: key);
//   _MainPageState createState() => _MainPageState();
// }
//
// List<BuyingPlan> list = [
//   BuyingPlan('1', '11', '111', FocusNode(), FocusNode(), FocusNode(), TextEditingController(), TextEditingController(), TextEditingController()),
//
// ];
//
// class _MainPageState extends State<SavedListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(children: <Widget>[
//           Expanded(child: _buildList(context)),
//           FlatButton(
//               onPressed: () {
//                 setState(() {
//                   list.add(BuyingPlan('', '', '', FocusNode(), FocusNode(), FocusNode(), TextEditingController(), TextEditingController(), TextEditingController()));
//                 });
//                 //hiding keyboard i guess
//                 WidgetsBinding.instance!.addPostFrameCallback((_) {
//                   FocusScope.of(context)
//                       .requestFocus(list[list.length - 1].myFocusNode1);
//                 });
//                 WidgetsBinding.instance!.addPostFrameCallback((_) {
//                   FocusScope.of(context)
//                       .requestFocus(list[list.length - 1].myFocusNode2);
//                 });
//                 WidgetsBinding.instance!.addPostFrameCallback((_) {
//                   FocusScope.of(context)
//                       .requestFocus(list[list.length - 1].myFocusNode3);
//                 });
//
//               },
//               child: Text('Add row'))
//         ]));
//   }
//
//   Widget _buildList(BuildContext context) {
//     return ListView.separated(
//       itemCount: list.length,
//       padding: const EdgeInsets.only(top: 1.0),
//       itemBuilder: (context, index) {
//         return PlanListView(index: index, planList: list);
//       },
//       separatorBuilder: (BuildContext context, int index) {
//         return const Divider();
//       },
//     );
//   }
//
//   //TODO 벗어나면 저장안된다고 경고문뜰거라 ㄱㅊ
//   @override
//   void dispose() {
//     for (var element in list) {
//       element.myFocusNode1.dispose();
//       element.myFocusNode2.dispose();
//       element.myFocusNode3.dispose();
//
//       element.myController1.dispose();
//       element.myController2.dispose();
//       element.myController3.dispose();
//     }
//
//     super.dispose();
//   }
// }


class SavedListScreen extends StatefulWidget{
  @override
  _SavedListScreen createState()=> _SavedListScreen();
}

class _SavedListScreen extends State<SavedListScreen>{
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
                    child: AddPlanBtnWidget(),
                  ),
                ],
              )
          ),
        )
    );
  }

}