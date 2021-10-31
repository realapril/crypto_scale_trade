import 'database.dart';
import 'package:moor/moor.dart';

part 's_plan.g.dart';

class ScalePlan extends Table{
  IntColumn get id => integer().autoIncrement()();
  RealColumn get buyingPrice => real()();
  RealColumn get amount => real()();
  RealColumn get totalValue => real()();
  BoolColumn get isTradeTypeBuying => boolean().withDefault(const Constant(true))();
}

class WholeScalePlan extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min:1)();
  DateTimeColumn get lastEditedTime=>
      dateTime().withDefault(Constant(DateTime.now()))();
}

@UseDao(tables:[ScalePlan, WholeScalePlan]) //, ScalePlanner
class ScalePlanDao extends DatabaseAccessor<Database> with _$ScalePlanDaoMixin{
  ScalePlanDao(Database db): super(db);

  Stream<List<WholeScalePlanData>> watchAllWPlans() => select(wholeScalePlan).watch();
  Stream<WholeScalePlanData> watchWPlan(int _id) =>
      (select(wholeScalePlan)..where((tbl)=> tbl.id.equals(_id))).watchSingle();

  Future insertWPlan(WholeScalePlanCompanion data) => into(wholeScalePlan).insert(data);
  Future updateWPlan(WholeScalePlanCompanion data) => update(wholeScalePlan).replace(data);
  Future deleteWPlan(WholeScalePlanCompanion data) => delete(wholeScalePlan).delete(data);


  Stream<List<ScalePlanData>> watchAllPlans() => select(scalePlan).watch();
}