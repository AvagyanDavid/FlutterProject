import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CommentWorker extends StatelessWidget {
  late String? commentValue;
  final Function(String?)? onChanged;

  CommentWorker({super.key, this.commentValue = '', this.onChanged});

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
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class Control extends StatelessWidget {
  late String? commentValue;
  final Function(String?)? onChanged;

  Control({super.key, this.commentValue = '', this.onChanged});

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

  CommentDirector({Key? key, this.valueDirector,this.onChanged}) : super(key: key);

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
              onChanged: onChanged,
            ),
          ],
        ),
      );
    } else {
      return SizedBox(height: 0);
    }
  }
}

class NewList extends StatelessWidget {
  late String? newListValue;
  final Function(String?)? onChanged;

  NewList({super.key, this.newListValue = '', this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(children: [
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            hintText: "Комментарий управляющего",
            fillColor: Colors.white,
          ),
          minLines: 1,
          maxLines: 50,
          textInputAction: TextInputAction.next,
          initialValue: newListValue,
          onChanged: onChanged,
        ),
      ],
      ),
    );
  }
}