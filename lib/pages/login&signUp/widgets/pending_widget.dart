import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mansau_sabah/models/plan.dart';
import 'package:mansau_sabah/services/database_service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PendingWidget extends StatefulWidget {
  const PendingWidget({super.key});

  @override
  State<PendingWidget> createState() => _PendingWidgetState();
}

class _PendingWidgetState extends State<PendingWidget> {
  User? user = FirebaseAuth.instance.currentUser;
  late String uid;

  final DatabaseService _databaseService = DatabaseService();

  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Plan>>(
      stream: _databaseService.plans,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Plan> plans = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: plans.length,
            itemBuilder: (context, index) {
              Plan plan = plans[index];
              final DateTime dt = plan.timestamp.toDate();
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Slidable(
                  key: ValueKey(plan.id),
                  endActionPane: ActionPane(motion: DrawerMotion(), children: [
                    SlidableAction(
                        backgroundColor: Colors.green.shade400,
                        foregroundColor: Colors.white,
                        icon: Icons.done,
                        label: "Completed",
                        onPressed: (context) {
                          _databaseService.updatePlanStatus(plan.id, true);
                        })
                  ]),
                  startActionPane:
                      ActionPane(motion: DrawerMotion(), children: [
                    SlidableAction(
                        backgroundColor: Colors.amber.shade400,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: "Edit",
                        onPressed: (context) {
                          _showPlanDialog(context, plan: plan);
                        }),
                    SlidableAction(
                        backgroundColor: Colors.red.shade400,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: "Delete",
                        onPressed: (context) async {
                          await _databaseService.updatePlanStatus(
                              plan.id, true);
                        }),
                  ]),
                  child: ListTile(
                    title: Text(
                      plan.title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      plan.description,
                    ),
                    trailing: Text(
                      '${dt.day}/${dt.month}/${dt.year}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.green[100],
            ),
          );
        }
      },
    );
  }

  void _showPlanDialog(BuildContext context, {Plan? plan}) {
    final TextEditingController _titleController =
        TextEditingController(text: plan?.title);
    final TextEditingController _descriptionController =
        TextEditingController(text: plan?.description);
    final DatabaseService _databaseService = DatabaseService();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade400,
          title: Text(
            plan == null ? "Add plan" : "Edit plan",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
          content: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                if (plan == null) {
                  await _databaseService.addPlan(
                      _titleController.text, _descriptionController.text);
                } else {
                  await _databaseService.updatePlan(plan.id,
                      _titleController.text, _descriptionController.text);
                }
                Navigator.pop(context);
              },
              child: Text(plan == null ? "Add" : "Update"),
            ),
          ],
        );
      },
    );
  }
}
