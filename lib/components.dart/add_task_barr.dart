/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mansau_sabah/components.dart/district_field.dart';
import 'package:mansau_sabah/components.dart/input_field.dart';
import 'package:mansau_sabah/components.dart/input_field_2.dart';
import 'package:mansau_sabah/components.dart/itinerary_button.dart';
import 'package:mansau_sabah/controllers/plan_controller.dart';
import 'package:mansau_sabah/models/plan.dart';
import 'package:mansau_sabah/theme/text_theme.dart';

class AddTaaskPage extends StatefulWidget {
  final Plan? plan;
  final DateTime? selectedDate;
  const AddTaaskPage({super.key, this.plan, this.selectedDate});

  @override
  State<AddTaaskPage> createState() => _AddTaaskPageState();
}

class _AddTaaskPageState extends State<AddTaaskPage> {
  final PlanController _planController = Get.put(PlanController());
  // ignore: unused_field
  final TextEditingController _titleController = TextEditingController();
  // ignore: unused_field
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _activityController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9.30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  // ignore: prefer_final_fields
  String _selectedDistrict = 'Penampang';
  List<String> districtList = [
    'Kota_Kinabalu',
    'Tuaran',
    'Penampang',
    'Papar',
  ];

  int _selectedColour = 0;

  int _selectedRemind = 5;
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];

  @override
  void initState() {
    super.initState();
    if (widget.plan != null) {
      _titleController.text = widget.plan!.title!;
      _locationController.text = widget.plan!.location!;
      _activityController.text = widget.plan!.activity!;
      _selectedDistrict = widget.plan!.district!;
      _selectedDate = DateFormat('dd-MM-yyyy, EEE').parse(widget.plan!.date!);
      _startTime = widget.plan!.startTime!;
      _endTime = widget.plan!.endTime!;
      _selectedRemind = widget.plan!.remind!;
      _selectedColour = widget.plan!.colour!;
    } else if (widget.selectedDate != null) {
      _selectedDate = widget.selectedDate!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: Colors.white,
      // ignore: avoid_unnecessary_containers
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyInputField(
                title: "Title",
                hint: "Enter title here",
                controller: _titleController,
              ),
              DistrictField(
                title: "District",
                hint: _selectedDistrict,
                //controller: _districtController,
                widget: DropdownButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    style: subtitleStyle,
                    underline: Container(
                      height: 0,
                    ),
                    items: districtList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black87),
                          ));
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedDistrict = newValue;
                        });
                      } else {
                        print("No district is selected");
                        setState(() {
                          _selectedDistrict = "Choose District";
                        });
                      }
                    }),
              ),
              MyInputField(
                title: "Location",
                hint: "Enter location",
                controller: _locationController,
              ),
              MyInputField(
                title: "Activity",
                hint: "Describe your activity",
                controller: _activityController,
              ),
              MyInputField2(
                title: "Date",
                hint: DateFormat('dd-MM-yyyy, EEE').format(_selectedDate),
                widget: IconButton(
                    onPressed: () {
                      _getDateFromUser();
                    },
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    )),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputField2(
                      title: "Start Time",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: MyInputField2(
                      title: "End Time",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              /*MyInputField2(
                  title: "Remind",
                  hint: "$_selectedRemind minutes early",
                  widget: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: subtitleStyle,
                      underline: Container(
                        height: 0,
                      ),
                      items:
                          remindList.map<DropdownMenuItem<String>>((int value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRemind = int.parse(newValue!);
                        });
                      })),*/
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colourPallete(),
                  ItineraryButton(
                      label: "Create task", onTap: () => _validateDate()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _validateDate() {
    if (_titleController.text.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _activityController.text.isNotEmpty) {
      if (widget.plan == null) {
        //creating a new plan
        _addTaskToDb();
      } else {
        //edit an existing plan
        _updateTaskInDb();
      }
      Get.back();
    } else if (_titleController.text.isEmpty ||
        _locationController.text.isEmpty ||
        _activityController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All fields are required!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.red,
        icon: Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
        ),
      );
    }
  }

  _updateTaskInDb() async {
    // Get the current user ID from Firebase
    String userId = FirebaseAuth.instance.currentUser!.uid;
    int value = await _planController.updatePlan(
      plan: Plan(
        id: widget.plan!.id, // important: keep the id
        title: _titleController.text,
        district: _selectedDistrict,
        isCompleted: widget.plan!.isCompleted, // keep existing status
        location: _locationController.text,
        activity: _activityController.text,
        date: DateFormat('dd-MM-yyyy, EEE').format(_selectedDate),
        startTime: _startTime,
        endTime: _endTime,
        remind: _selectedRemind,
        colour: _selectedColour,
        userId: userId,
      ),
    );
    print("Updated plan id: $value");
  }

  _addTaskToDb() async {
    // Get the current user ID from Firebase
    String userId = FirebaseAuth.instance.currentUser!.uid;
    int value = await _planController.addPlan(
      plan: Plan(
        title: _titleController.text,
        district: _selectedDistrict,
        isCompleted: 0,
        location: _locationController.text,
        activity: _activityController.text,
        date: DateFormat('dd-MM-yyyy, EEE').format(_selectedDate),
        startTime: _startTime,
        endTime: _endTime,
        remind: 5,
        colour: _selectedColour,
        userId: userId,
      ),
    );
    print("My id is " + "$value");
  }

  _colourPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Colour",
          style: titleStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            final colors = [
              Colors.teal.shade100, // Soft fresh blue
              Color(0xFFA7C7E7), // Calm and natural green
              Color(0xFFF6E0D7)
            ];
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColour = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: colors[index],
                  child: _selectedColour == index
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16,
                        )
                      : Container(),
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black87,
        ),
      ),
      title: Text(
        'Add Plan',
        style: headingStyle,
      ),
    );
  }

  _getDateFromUser() async {
    // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2126),
    );

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      // ignore: avoid_print
      print("It's empty or something is wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    final pickedTime = await _showTimePicker();
    if (pickedTime != null) {
      final formattedTime = pickedTime.format(context);
      setState(() {
        if (isStartTime) {
          _startTime = formattedTime;
        } else {
          _endTime = formattedTime;
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Time selection canceled.')),
      );
      print("Time selection canceled.");
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        ));
  }
}*/
