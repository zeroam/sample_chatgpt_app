import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sample_chatgpt_app/constants/constants.dart';
import 'package:sample_chatgpt_app/widgets/text_widget.dart';

List<DropdownMenuItem<String>>? get getModelItem {
  List<DropdownMenuItem<String>>? modelItems =
      List<DropdownMenuItem<String>>.generate(
    models.length,
    (index) => DropdownMenuItem(
      value: models[index],
      child: TextWidget(
        label: models[index],
        fontSize: 15,
      ),
    ),
  );
  return modelItems;
}

class ModelDropDownWidget extends StatefulWidget {
  const ModelDropDownWidget({super.key});

  @override
  State<ModelDropDownWidget> createState() => _ModelDropDownWidgetState();
}

class _ModelDropDownWidgetState extends State<ModelDropDownWidget> {
  String currentModel = "Model1";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: scaffoldBackgroundColor,
      iconEnabledColor: Colors.white,
      items: getModelItem,
      value: currentModel,
      onChanged: (value) {
        setState(() {
          currentModel = value.toString();
        });
      },
    );
  }
}
