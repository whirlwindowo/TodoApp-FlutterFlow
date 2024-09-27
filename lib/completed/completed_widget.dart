import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_task_widget.dart';
import '/components/task_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'completed_model.dart';
export 'completed_model.dart';

class CompletedWidget extends StatefulWidget {
  const CompletedWidget({super.key});

  @override
  State<CompletedWidget> createState() => _CompletedWidgetState();
}

class _CompletedWidgetState extends State<CompletedWidget> {
  late CompletedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompletedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: const AddTaskWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 0.0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: const Icon(
              Icons.add_rounded,
              color: Colors.black,
              size: 30.0,
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                child: Text(
                  'Completed',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Ubuntu',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<TasksRecord>>(
                  stream: queryTasksRecord(
                    queryBuilder: (tasksRecord) => tasksRecord
                        .where(
                          'user',
                          isEqualTo: currentUserReference,
                        )
                        .where(
                          'completed',
                          isEqualTo: true,
                        ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<TasksRecord> listViewTasksRecordList = snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewTasksRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewTasksRecord =
                            listViewTasksRecordList[listViewIndex];
                        return TaskWidget(
                          key: Key(
                              'Key6t3_${listViewIndex}_of_${listViewTasksRecordList.length}'),
                          taskText: listViewTasksRecord.title,
                          completed: listViewTasksRecord.completed,
                          tasksDocument: listViewTasksRecord,
                          checkAction: () async {
                            await listViewTasksRecord.reference
                                .update(createTasksRecordData(
                              completed: false,
                            ));
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
