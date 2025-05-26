/*import 'package:get/get.dart';
import 'package:mansau_sabah/database/db_helper.dart';
import 'package:mansau_sabah/models/plan.dart';

class PlanController extends GetxController {
  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  var planList = <Plan>[].obs;

    Future<int> addPlan({Plan? plan}) async {
    if (plan == null || plan.userId == null) {
      print("Error: Plan or userId is null");
      return -1;
    }
    return await DbHelper.insert(plan);
  }


  //Future<int> addPlan({Plan? plan}) async {
    //return await DbHelper.insert(plan);
  //}

  Future<int> updatePlan({required Plan plan}) async {
    return await DbHelper.updatePlan(plan);
  }

  //get all the data from the table
  void getPlans(String userId) async {
    List<Map<String, dynamic>> plans = await DbHelper.query(userId);
    planList.assignAll(plans.map((data) => new Plan.fromJson(data)).toList());
  }

  void delete(Plan plan) {
    DbHelper.delete(plan);
    getPlans(plan.userId!);
  }

  void markTaskCompleted(int id) async {
    await DbHelper.update(id);
    getPlans(id.toString());
  }
}*/
