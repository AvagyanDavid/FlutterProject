import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/models/listBranch.dart';
import 'package:test_form/component/models/listUsers.dart';
import 'package:test_form/screens/registration.dart';
import 'package:test_form/screens/singleEmploy.dart';

class Employees extends StatefulWidget {
  final int id;

  Employees({required this.id});

  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  String? otvet;

  String? selectedValue;
  final List<ListBranch> listBranch = [
    ListBranch(idBranch: 1, branchName: 'Стрип Барсук Казань'),
    ListBranch(idBranch: 2, branchName: 'Стрип Чилли Тюмень'),
    ListBranch(idBranch: 3, branchName: 'Релакс Барсук Казань'),
    ListBranch(idBranch: 4, branchName: 'Стрип Барсук Тюмень'),
    ListBranch(idBranch: 5, branchName: 'Релакс Чилаут Тюмень')
  ];

  DateTime now = DateTime.now();

  List Users = [];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    String date = '${now.year}-${now.month}-${now.day}';

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 0, 0, 100),
            height: 250,
            decoration: const BoxDecoration(
              color: Color(0xff000000),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Привет Владелец',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        color: Color(0xffffffff),
                      ),
                    ),
                    Text(
                      'сегодня $date',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        color: Color(0xffffffff),
                      ),
                    ),
                    DropdownButton(
                      items: listBranch.map((valueItem) {
                        return DropdownMenuItem(
                          child: Text(valueItem.branchName),
                          value: valueItem.idBranch.toString(),
                        );
                      }).toList(),
                      value: selectedValue,
                      hint: const Text('Выберите филиал'),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.white),
                      dropdownColor: Colors.black,
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (newValue) async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });

                        final responseBranchSelection = await Api().branchSelection(int.parse(newValue!));
                        Navigator.of(context).pop();

                        debugPrint(responseBranchSelection.toString());

                        setState(() {
                          Users.clear();
                          selectedValue = newValue;

                          otvet = responseBranchSelection[0]["message"];

                          if (otvet != "Error" && otvet != "Нет сотрудников") {
                            for (int i = 0; i < responseBranchSelection.length; i++) {
                              Users.add(ListUsers(
                                  idUsers: responseBranchSelection[i]["idUsers"],
                                  login: responseBranchSelection[i]["Login"],
                                  password: responseBranchSelection[i]["Password"],
                                  post: responseBranchSelection[i]["Post"],
                                  idBranch: responseBranchSelection[i]["idBranch"],
                                  branchName: responseBranchSelection[i]["BranchName"]));
                            }
                            otvet = '0';
                            debugPrint(Users.toString());
                            debugPrint(otvet.toString());
                          }

                          /// вызов Api
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset("assets/emblem.png"),
                ),
              ),
            ]),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  width: double.infinity,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    const SizedBox(
                      child: Text(
                        'Сотрудники',
                        style: TextStyle(
                          fontSize: 25,
                          height: 1.2999999523,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Builder(builder: (BuildContext context) {
                      if (otvet == '0' && otvet != 'Error' && otvet != 'Нет сотрудников') {
                        // return GridView.builder(
                        //   // Убрать прокрутку внутри GridView и поставить на весь экран под Navbar
                        //     itemCount: Users.length,
                        //     scrollDirection: Axis.vertical,
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     shrinkWrap: true,
                        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        //     itemBuilder: (context, index) => Padding(
                        //       padding: const EdgeInsets.all(8.0),
                        //       child: SizedBox(
                        //         height: 20,
                        //         width: MediaQuery.of(context).size.width,
                        //         child: ElevatedButton(
                        //             onPressed: () {},
                        //             style: ButtonStyle(
                        //               backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        //                 RoundedRectangleBorder(
                        //                   borderRadius: BorderRadius.circular(10.0),
                        //                 ),
                        //               ),
                        //
                        //             ),
                        //             child: Text(
                        //               Users[index].login,
                        //               style: const TextStyle(
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.w400,
                        //                 height: 1.3,
                        //                 color: Colors.black,
                        //               ),
                        //         )
                        //                                   ),
                        //       ),
                        //     )
                        // );
                        return ListView.builder(
                              itemCount: Users.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, i) => ListTile(
                                title: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              Users[i].post,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                height: 1.3,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors.white,
                                              thickness: 3,
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Registration(post: Users[i].post)),
                                            );
                                          },
                                          child: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                        Row(
                                          children : [
                                            for (int j = 0; j < Users.length; j++)
                                              if(Users[j].post == Users[i].post)
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => SimpleEmploy(
                                                    id: Users[j].idUsers,
                                                    post: Users[j].post,
                                                    login: Users[j].login,
                                                    password: Users[j].password,
                                                    branch: selectedValue!,
                                                  )),
                                                );
                                              },
                                            child: Text(
                                              Users[j].login,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                height: 1.3,
                                                color: Colors.white,
                                              ),
                                            ),
                                            )
                                          ]
                                        )
                                  ],
                                ),
                              ),
                        );
                      } else if (otvet == 'Нет сотрудников') {
                        return Center(
                          child: Text(
                            otvet!,
                            style: const TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            "Выберите филиал",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        );
                      }
                    }),
                  ]),
                ),
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}