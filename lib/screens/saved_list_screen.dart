import 'package:crypto_scale_trade/component/add_plan_btn.dart';
import 'package:crypto_scale_trade/component/person_tile.dart';
import 'package:crypto_scale_trade/component/plan_list_view.dart';
import 'package:crypto_scale_trade/component/saved_plan_card.dart';
import 'package:crypto_scale_trade/db/database.dart';
import 'package:crypto_scale_trade/db/s_plan.dart';
import 'package:crypto_scale_trade/model/scale_trading_plan.dart';
import 'package:crypto_scale_trade/model/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class SavedListScreen extends StatefulWidget{
  @override
  _SavedListScreen createState()=> _SavedListScreen();

}

class _SavedListScreen extends State<SavedListScreen>{
  @override
  void initState() {
    super.initState();

    if(!GetIt.instance.isRegistered<ScalePlanDao>()){
      final db = Database();
      GetIt.instance.registerSingleton(ScalePlanDao(db));
    }
  }

  @override
  Widget build(BuildContext context) {
    final dao = GetIt.instance<ScalePlanDao>();
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.scale)),
        body: StreamBuilder<List<WholeScalePlanData>>(
          stream: dao.getAllWPlans(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              final data = snapshot.data!;
              return ListView.separated(
                  itemBuilder: (_, index) {
                    final item = data[index];

                    return SavedPlanCard(
                      title: item.name,
                      createdAt: item.lastEditedTime,
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Divider();
                  },
                  itemCount: data.length);

            }else{
              return Container();
            }
          },
        )
    );
  }

}