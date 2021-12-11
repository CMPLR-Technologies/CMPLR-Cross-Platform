// ignore_for_file: prefer_final_locals

<<<<<<< HEAD
import 'dart:convert';
=======
import 'package:get/get_rx/src/rx_types/rx_types.dart';
>>>>>>> 8f5a2a095e014130abe28586360c9f5155f601fd

import '../../../cmplr_service.dart';
import 'user_note.dart';

class NotesModel {
  Future<List<List<UserNote>>> getNotes() async {
<<<<<<< HEAD
    final notes = <UserNote>[];
    final response = await CMPLRService.getNotes('/notes', {});
    final responseBody = jsonDecode(response.body);
    for (var i = 0; i < responseBody['total_notes']; i++) {
      notes.add(UserNote.fromJson(responseBody['notes'][i]));
    }
    print(notes.length);
=======
    var _comments = <UserNote>[];
    var _reblogsWithComments = <UserNote>[];
    var _otherReblogs = <UserNote>[];
    var _likes = <UserNote>[];
    final notes = await CMPLRService.getNotes('/notes');
>>>>>>> 8f5a2a095e014130abe28586360c9f5155f601fd
    for (var i = 0; i < notes.length; i++) {
      switch (notes[i].noteType) {
        case 'reply':
          _comments.add(notes[i]);
          break;
        case 'reblog_with_comment':
          _reblogsWithComments.add(notes[i]);
          break;
        case 'reblog':
          _otherReblogs.add(notes[i]);
          break;
        case 'like':
          _likes.add(notes[i]);
          break;
        default:
          break;
      }
    }
    // ignore: omit_local_variable_types
    List<List<UserNote>> classifiedNotes = [];
    classifiedNotes.add(_comments);
    classifiedNotes.add(_reblogsWithComments);
    classifiedNotes.add(_otherReblogs);
    classifiedNotes.add(_likes);
    return classifiedNotes;
  }
}
