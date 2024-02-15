import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/checkbox/bloc/checkbox_bloc.dart';
import 'package:test_form/component/ratio/bloc/ratio_bloc.dart';

class Registration extends StatelessWidget {

  final String post;
  Registration({required this.post});

  CheckboxBloc checkboxBloc = CheckboxBloc();
  // RatioBloc ratioBloc = RatioBloc();
  String login = '';
  String password1 = '';
  String password2 = '';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Новый сотрудник(${post})',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  height: 2,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FormBuilderTextField(
                name: 'CommentWorker',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  hintText: "Логин",
                  fillColor: Colors.white,
                ),
                textInputAction: TextInputAction.next,
                initialValue: login,
                onChanged: (value) {
                  login = value!;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FormBuilderTextField(
                name: 'CommentWorker',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  hintText: "Пароль",
                  fillColor: Colors.white,
                ),
                textInputAction: TextInputAction.next,
                initialValue: password1,
                onChanged: (value) {
                  password1 = value!;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FormBuilderTextField(
                name: 'CommentWorker',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  hintText: "Введите пароль повторно",
                  fillColor: Colors.white,
                ),
                textInputAction: TextInputAction.next,
                initialValue: password2,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //   child: BlocProvider<RatioBloc>(
            //     create: (context) => ratioBloc,
            //     child: BlocBuilder<RatioBloc, RatioState>(
            //       builder: (context, state) {
            //         List<FormBuilderChipOption<Object>> options = [
            //           const FormBuilderChipOption<Object>(
            //             value: 'Art',
            //             child: Text('Арт'),
            //           ),
            //           const FormBuilderChipOption<Object>(
            //             value: 'Barman',
            //             child: Text('Бармен'),
            //           ),
            //           const FormBuilderChipOption<Object>(
            //             value: 'Host',
            //             child: Text('Хост'),
            //           ),
            //           const FormBuilderChipOption<Object>(
            //             value: 'Waiter',
            //             child: Text('Официант'),
            //           ),
            //           const FormBuilderChipOption<Object>(
            //             value: 'Manager',
            //             child: Text('Управляющий'),
            //           ),
            //         ];
            //         return FormBuilderChoiceChip(
            //           runSpacing: 5.0,
            //           selectedColor: Colors.blue,
            //           name: 'choice_chip',
            //           decoration: const InputDecoration(labelText: 'Должность'),
            //           options: options,
            //           initialValue: post,
            //           onChanged: (value) {
            //             post = value.toString()!;
            //             print(post);
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 50),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.green,
              ),
              onPressed: () async {
                Api().registration(login, password1, post);
                Navigator.pop(context);
              },
              child: const Text(
                'Создать',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.3,
                  color: Colors.white,
                ),
              ),
            ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100,50),
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.red,
                ),
                onPressed: () { Navigator.pop(context); },
                child: const Text('Назад',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.3,
                      color: Colors.white,
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}