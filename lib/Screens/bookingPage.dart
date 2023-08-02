import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelplanning/Screens/bookAirlines.dart';
import 'package:travelplanning/Screens/detailPage.dart';
import 'package:travelplanning/Screens/finalPayment.dart';
import 'package:travelplanning/Screens/payment.dart';
import 'package:travelplanning/Screens/rentCar.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with TickerProviderStateMixin {
  TextEditingController name = TextEditingController();
  String result = "";
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();

  Future<void> bookingSaved() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      final data = {
        "name": name.text,
        "email": email.text,
        "number": number.text,
      };
      db.collection("booking").add(data).then((documentSnapshot) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Booked Successfully")));
        print("Added Data with ID: ${documentSnapshot.id}");
      });
    } catch (e) {
      print(e);
    }
  }

  int number1 = 0;
  int number2 = 0;
  int number3 = 0;

  void incrementNumber1() {
    setState(() {
      number1++;
    });
  }

  void decrementNumber1() {
    setState(() {
      number1--;
    });
  }

  void incrementNumber2() {
    setState(() {
      number2++;
    });
  }

  void decrementNumber2() {
    setState(() {
      number2--;
    });
  }

  void incrementNumber3() {
    setState(() {
      number3++;
    });
  }

  void decrementNumber3() {
    setState(() {
      number3--;
    });
  }

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null) {
      setState(() {
        controller.text = _dateFormat.format(selectedDate);
      });
    }
  }

  final TextEditingController _date = TextEditingController();

  // int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);

    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Stack(children: [
                  Positioned(
                      child: Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('img/bookingImage.png'),
                            fit: BoxFit.fill)),
                  )),
                  Positioned(
                      left: 0,
                      top: 20,
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailPage(documentId: '')));
                            },
                            icon: const Icon(Icons.arrow_back),
                          )
                        ],
                      )),
                  Positioned(
                    top: 180,
                    child: Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        width: MediaQuery.of(context).size.width,
                        height: 800,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'CHECK-IN',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'CHECK-OUT',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _startDateController,
                                        readOnly: true,
                                        onTap: () => _selectDate(
                                            context, _startDateController),
                                        decoration: const InputDecoration(
                                          labelText: 'Select a Date ',
                                          border: OutlineInputBorder(),
                                          icon: Icon(
                                              Icons.calendar_today_rounded),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: TextField(
                                        controller: _endDateController,
                                        readOnly: true,
                                        onTap: () => _selectDate(
                                            context, _endDateController),
                                        decoration: const InputDecoration(
                                          hintText: 'Select a Date',
                                          border: OutlineInputBorder(),
                                          icon: Icon(
                                              Icons.calendar_today_rounded),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'YOUR NAME',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: name,
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Name is required";
                                    }
                                    if (value != String) {
                                      return "Name must be in string";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                      size: 22.0,
                                    ),
                                    hintText: ' Enter you full name',
                                    hintStyle: TextStyle(
                                        fontFamily: 'WorkSansSemiBold',
                                        fontSize: 17.0),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'E-MAIL ADDRESS',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    final RegExp emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                    if (value == null || value.isEmpty) {
                                      return "Email is required";
                                    }
                                    if (!emailValid.hasMatch(value)) {
                                      return "Please enter a valid email";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.black,
                                      size: 22.0,
                                    ),
                                    hintText: 'Enter you email address',
                                    hintStyle: TextStyle(
                                        fontFamily: 'WorkSansSemiBold',
                                        fontSize: 17.0),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'PHONE NUMBER',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: number,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.black,
                                      size: 22.0,
                                    ),
                                    hintText: '+977 Enter you phone number',
                                    hintStyle: TextStyle(
                                        fontFamily: 'WorkSansSemiBold',
                                        fontSize: 17.0),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TabBar(
                                      // labelPadding: const EdgeInsets.only(left: 0, right: 0),
                                      controller: tabController,
                                      labelColor: Colors.black,
                                      unselectedLabelColor: Colors.grey,

                                      isScrollable: true,
                                      tabs: const [
                                        Tab(
                                          text: "Hotels",
                                        ),
                                        Tab(text: "Budget"),
                                        Tab(text: "Standard"),
                                        Tab(text: "5-Star"),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 10),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Adults',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Kids',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'No. of rooms',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IncrementDecrementBox(
                                        number: number1,
                                        increment: incrementNumber1,
                                        decrement: decrementNumber1,
                                      ),
                                      IncrementDecrementBox(
                                        number: number2,
                                        increment: incrementNumber2,
                                        decrement: decrementNumber2,
                                      ),
                                      IncrementDecrementBox(
                                        number: number3,
                                        increment: incrementNumber3,
                                        decrement: decrementNumber3,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'Choose your travelling preferences: ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w100),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.grey,
                                              backgroundColor:
                                                  const Color(0xFFFFF9C4),
                                              minimumSize: Size(150, 50)),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const BookAirlines()),
                                            );
                                          },
                                          child: const Text(
                                            "Airlines",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(width: 50),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.grey,
                                              backgroundColor:
                                                  const Color(0xFFFFF9C4),
                                              minimumSize: Size(150, 50)),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RentCar()),
                                            );
                                          },
                                          child: const Text(
                                            "Rental Cars",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.grey,
                                          backgroundColor:
                                              const Color(0xFFFFF9C4),
                                        ),
                                        onPressed: () {
                                          bookingSaved();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text("Registered")),
                                          );
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const FinalPayment()));
                                        },
                                        child: const Text(
                                          "Book Now",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ]))));
  }
}

class IncrementDecrementBox extends StatelessWidget {
  final int number;
  final VoidCallback increment;
  final VoidCallback decrement;

  const IncrementDecrementBox({
    super.key,
    required this.number,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: decrement,
        ),
        Text(number.toString()),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: increment,
        ),
      ],
    );
  }
}
