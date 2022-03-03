import 'package:cms/screens/home/class_settings_form.dart';
import 'package:cms/shared/text_styles.dart';
import 'package:flutter/material.dart';

class ClassButtonList extends StatefulWidget {
  const ClassButtonList({ Key? key }) : super(key: key);

  @override
  State<ClassButtonList> createState() => _ClassButtonListState();
}

class _ClassButtonListState extends State<ClassButtonList> {
  @override
  Widget build(BuildContext context) {

    void _modifyClassname() {
      showModalBottomSheet(
          backgroundColor: Colors.blue[100],
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: ClassSettingsForm(),
            );
          });
    }

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.green.shade50),
                    ),
                    onPressed: () => _modifyClassname(),
                    style: textstyles,
                  ),
                ),
              ),
              SizedBox(width: 7.5),
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Modify',
                      style: TextStyle(color: Colors.green.shade50),
                    ),
                    onPressed: () => {},
                    style: textstyles,
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}