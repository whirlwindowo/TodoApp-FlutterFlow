import '/flutter_flow/flutter_flow_util.dart';
import 'add_task_widget.dart' show AddTaskWidget;
import 'package:flutter/material.dart';

class AddTaskModel extends FlutterFlowModel<AddTaskWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TitleField widget.
  FocusNode? titleFieldFocusNode;
  TextEditingController? titleFieldTextController;
  String? Function(BuildContext, String?)? titleFieldTextControllerValidator;
  // State field(s) for DetailsField widget.
  FocusNode? detailsFieldFocusNode;
  TextEditingController? detailsFieldTextController;
  String? Function(BuildContext, String?)? detailsFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFieldFocusNode?.dispose();
    titleFieldTextController?.dispose();

    detailsFieldFocusNode?.dispose();
    detailsFieldTextController?.dispose();
  }
}
