import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mansau_sabah/models/plan.dart';
import 'package:mansau_sabah/pages/login&signUp/widgets/pending_widget.dart';
import 'package:mansau_sabah/pages/login&signUp/widgets/completed_widget.dart';
import 'package:mansau_sabah/services/database_service.dart';

class ItineraryPage extends StatefulWidget {
  const ItineraryPage({super.key});

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  int _buttonIndex = 0;
  final _widgets = [
    //pending plans
    PendingWidget(),
    //Completed plans
    CompletedWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Itinerary',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 26,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _buttonIndex = 0;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                      color: _buttonIndex == 0
                          ? const Color.fromARGB(255, 14, 149, 20)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Explore",
                        style: GoogleFonts.poppins(
                            fontSize: _buttonIndex == 0 ? 16 : 14,
                            fontWeight: FontWeight.w500,
                            color: _buttonIndex == 0
                                ? Colors.white
                                : Colors.black45),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    setState(() {
                      _buttonIndex = 1;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                      color: _buttonIndex == 1
                          ? const Color.fromARGB(255, 14, 149, 20)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Completed",
                        style: GoogleFonts.poppins(
                            fontSize: _buttonIndex == 0 ? 16 : 14,
                            fontWeight: FontWeight.w500,
                            color: _buttonIndex == 1
                                ? Colors.white
                                : Colors.black45),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            _widgets[_buttonIndex],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[400],
          child: Icon(Icons.add),
          onPressed: () {
            _showPlanDialog(context);
          }),
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

/*// ignore: unnecessary_import
// ignore: unnecessary_import
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mansau_sabah/components.dart/add_task_barr.dart';
import 'package:mansau_sabah/components.dart/itinerary_button.dart';
import 'package:mansau_sabah/controllers/plan_controller.dart';
import 'package:mansau_sabah/models/plan.dart';
import 'package:mansau_sabah/theme/text_theme.dart';
import 'package:mansau_sabah/widgets/plan_tile.dart';

class ItineraryPage extends StatefulWidget {
  const ItineraryPage({super.key});

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  DateTime _selectedDate = DateTime.now();
  final _planController = Get.put(PlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          const SizedBox(height: 10),
          _showPlans(),
        ],
      ),
    );
  }

  _showPlans() {
    return Expanded(
      child: Obx(() {
        return _planController.planList.isEmpty
            ? Center(
                child: Text(
                  "No plans available. Add some!",
                  style: subtitleStyle.copyWith(color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: _planController.planList.length,
                itemBuilder: (_, index) {
                  Plan plan = _planController.planList[index];
                  if (plan.date ==
                      DateFormat('dd-MM-yyyy, EEE').format(_selectedDate)) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () => _showBottomSheet(context, plan),
                            child: PlanTile(plan),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                });
      }),
    );
  }

  _showBottomSheet(BuildContext context, Plan plan) {
    final double bottomSheetHeight = plan.isCompleted == 1
        ? MediaQuery.of(context).size.height * 0.30
        : MediaQuery.of(context).size.height * 0.38;
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        height: bottomSheetHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          children: [
            Container(
              height: 6,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
            ), 
            const Spacer(),
            if (plan.isCompleted != 1)
              _bottomSheetButton(
                  label: "Mark as Completed",
                  onTap: () {
                    _planController.markTaskCompleted(plan.id!);
                    Get.back();
                  },
                  clr: Colors.teal.shade600,
                  context: context),
            _bottomSheetButton(
                label: "Edit Plan",
                onTap: () async {
                  Get.back();
                  await Get.to(() => AddTaaskPage(plan: plan)); 
                  String userId = FirebaseAuth.instance.currentUser!.uid;
                  // Pass the userId to getPlans
                  _planController.getPlans(userId);
                },
                clr: Colors.amber.shade700,
                context: context),
            _bottomSheetButton(
                label: "Delete Plan",
                onTap: () {
                  _planController.delete(plan);
                  Get.back();
                },
                clr: Colors.red.shade400,
                context: context),
            const SizedBox(height: 20),
            _bottomSheetButton(
                label: "Close",
                onTap: () {
                  Get.back();
                },
                clr: Colors.grey.shade300,
                isClose: true,
                context: context),
          ],
        ),
      ),
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose ? Colors.grey.shade400 : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.white : clr,
          boxShadow: [
            if (!isClose)
              BoxShadow(
                color: clr.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              color: isClose ? Colors.black87 : Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate:_selectedDate,
        //DateTime.now(),
        selectionColor: Colors.teal.shade600,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.dmSans(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black54,
        ),
        dayTextStyle: GoogleFonts.dmSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
        monthTextStyle: GoogleFonts.dmSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.black45,
        ),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Today's Plans",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  color: Colors.black87,
                ),
              )
            ],
          ),
          ItineraryButton(
            label: "+ Add Plan",
            onTap: () async {
              await Get.to(() => AddTaaskPage(selectedDate: _selectedDate,));
              // Fetch the current user's ID
              String userId = FirebaseAuth.instance.currentUser!.uid;
              _planController.getPlans(userId);
            },
          )
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 239, 243, 249),
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Itinerary',
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 26,
        ),
      ),
    );
  }
}*/
