import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'bookingPage.dart';

class RentCar extends StatefulWidget {
  const RentCar({Key? key}) : super(key: key);


  @override
  State<RentCar> createState() => _RentCarState();
}

class _RentCarState extends State<RentCar> with TickerProviderStateMixin{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> bookingSaved() async {
    try {
      final data = {
        "from": _selectedVal,
        "to": _selectedtt,
        "departureDate": Timestamp.fromDate(_selectedDate!),
        "returnDate": Timestamp.fromDate(_selectedReturnDate!),
        "pickupTime": _selectedTime != null
            ? Timestamp.fromDate(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          _selectedTime!.hour,
          _selectedTime!.minute,
        ))
            : null,
      };

      DocumentReference docRef = await firestore.collection("rent a car").add(data);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Booked Successfully")),
      );
      print("Added Data with ID: ${docRef.id}");
    } catch (e) {
      print(e);
    }
  }


  _rentCarState(){
    _selectedVal=frm[0];
    _selectedtt=tt[0];
  }
  int _currentIndex = 3;
  DateTime? _selectedDate;
  DateTime? _selectedReturnDate;
  TimeOfDay? _selectedTime;
  final frm = ["Kathmandu", "Pokhara", "Palpa", "Mustang", "Jomson", "Birgunj", "Chitwan", "Lumbini"];
  String? _selectedVal;
  final tt = ["Kathmandu", "Pokhara", "Palpa", "Mustang", "Jomson", "Birgunj", "Chitwan", "Lumbini"];
  String? _selectedtt;
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (int index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.black,
      //   showUnselectedLabels: false,
      //   showSelectedLabels: false,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Users"),
      //   ],
      // ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 0, top: 0),
                width: double.maxFinite,
                height: 1000,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/rentACar.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
             IconButton(
      padding: const EdgeInsets.only(left: 10, top: 30, right: 25),
      icon: const Icon(Icons.arrow_back_outlined),
      onPressed: () {
         Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const BookingPage()));
      },
    ),
            Container(
              padding: const EdgeInsets.only(left: 50, right: 20, top: 28),
              child: const Column(
                children: [
                  Text(
                    'Rent A Car',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 20, top: 65),
              child: Column(
                children: [
                  const Text(
                    'Car Hire- Search, Compare and Save \nFree Cancellations on most bookings  60, 000+ locations \nCustomer support in 40+ languages',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.car_rental),
                        text: "Car",
                      ),
                      Tab(
                        icon: Icon(Icons.train),
                        text: "Train",
                      ),
                      Tab(
                        icon: Icon(Icons.holiday_village),
                        text: "Holiday Package",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 260,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("From"),
                              const SizedBox(height: 5),
                              DropdownButton<String>(
                                hint: const Text("From"),
                                value: _selectedVal,
                                items: frm.map((e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(e),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _selectedVal = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("To"),
                              const SizedBox(height: 5),
                              DropdownButton<String>(
                                hint: const Text("To"),
                                value: _selectedtt,
                                items: tt.map((e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(e),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _selectedtt = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Departure"),
                              const SizedBox(height: 5),
                              InkWell(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  ).then((date) {
                                    setState(() {
                                      _selectedDate = date;
                                    });
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.calendar_today),
                                      const SizedBox(width: 10),
                                      Text(
                                        _selectedDate != null
                                            ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                                            : "Select Date",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Return"),
                              const SizedBox(height: 5),
                              InkWell(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  ).then((date) {
                                    setState(() {
                                      _selectedReturnDate = date;
                                    });
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.calendar_today),
                                      const SizedBox(width: 10),
                                      Text(
                                        _selectedReturnDate != null
                                            ? "${_selectedReturnDate!.day}/${_selectedReturnDate!.month}/${_selectedReturnDate!.year}"
                                            : "Select Date",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Pickup Time"),
                        const SizedBox(height: 5),
                        InkWell(
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((time) {
                              setState(() {
                                _selectedTime = time;
                              });
                            });
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.access_time),
                                const SizedBox(width: 10),
                                Text(
                                  _selectedTime != null
                                      ? "${_selectedTime!.format(context)}"
                                      : "Select Time",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          bookingSaved();

                          // Add your submit button functionality here
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
