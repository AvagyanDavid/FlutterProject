import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CommentWorker extends StatelessWidget {
  late String? commentValue;
  final Function(String?)? onChanged;
  final bool readOnly;

  CommentWorker({super.key, this.commentValue = '', this.onChanged, required this.readOnly});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(children: [
              FormBuilderTextField(
                name: 'CommentWorker',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  hintText: "Напиши комментарий",
                  fillColor: Colors.white,
                ),
                textInputAction: TextInputAction.next,
                initialValue: commentValue,
                onChanged: onChanged,
                readOnly: readOnly,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class ShowCommentWorker extends StatelessWidget {
  late String? commentValue;
  final TextEditingController textController;

  ShowCommentWorker({required String? commentValue})
      : textController = TextEditingController(text: commentValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(children: [
              FormBuilderTextField(
                name: 'CommentWorker',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  fillColor: Colors.white,
                ),
                controller: textController,
                readOnly: true,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class CommentDirector extends StatelessWidget {
  String? valueDirector;
  final Function(String?)? onChanged;
  final bool readOnly;


  CommentDirector(
      {Key? key, this.valueDirector, this.onChanged, required this.readOnly});

  @override
  Widget build(BuildContext context) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
              children: [
                FormBuilderTextField(
                  name: 'CommentWorker',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: "Комментарий управляющего",
                    fillColor: Colors.white,
                  ),
                  textInputAction: TextInputAction.next,
                  initialValue: valueDirector,
                  onChanged: onChanged,
                  readOnly: readOnly,
                )
              ]
          )
      );
    }
  }

class ShowCommentDirector extends StatelessWidget {
  String? valueDirector;
  final TextEditingController textController;

  ShowCommentDirector({Key? key, this.valueDirector}) : textController = TextEditingController(text: valueDirector);

  @override
  Widget build(BuildContext context) {
    if (valueDirector != null) {
      final commentKey = Key(valueDirector!);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            FormBuilderTextField(
              key: commentKey,
              name: 'CommentWorker',
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                hintText: "Комментарий управляющего",
                fillColor: Colors.white,
              ),
              textInputAction: TextInputAction.next,
              initialValue: valueDirector,
            ),
          ],
        ),
      );
    } else {
      return const SizedBox(height: 0);
    }
  }
}