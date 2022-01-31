// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CourseViewModel on _CourseViewModel, Store {
  final _$courseModelAtom = Atom(name: '_CourseViewModel.courseModel');

  @override
  CourseModel get courseModel {
    _$courseModelAtom.reportRead();
    return super.courseModel;
  }

  @override
  set courseModel(CourseModel value) {
    _$courseModelAtom.reportWrite(value, super.courseModel, () {
      super.courseModel = value;
    });
  }

  final _$addCourseAsyncAction = AsyncAction('_CourseViewModel.addCourse');

  @override
  Future<dynamic> addCourse(CourseModel courseModel) {
    return _$addCourseAsyncAction.run(() => super.addCourse(courseModel));
  }

  final _$updateCourseAsyncAction =
      AsyncAction('_CourseViewModel.updateCourse');

  @override
  Future<dynamic> updateCourse(CourseModel courseModel) {
    return _$updateCourseAsyncAction.run(() => super.updateCourse(courseModel));
  }

  final _$_CourseViewModelActionController =
      ActionController(name: '_CourseViewModel');

  @override
  dynamic deleteCourse(CourseModel courseModel) {
    final _$actionInfo = _$_CourseViewModelActionController.startAction(
        name: '_CourseViewModel.deleteCourse');
    try {
      return super.deleteCourse(courseModel);
    } finally {
      _$_CourseViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
courseModel: ${courseModel}
    ''';
  }
}
