// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notedo_app/widgets/item_card.dart';

class NoteAndTodoItemCardSlidable extends StatefulWidget {
  const NoteAndTodoItemCardSlidable({
    super.key,
    required this.noteTitle,
    this.hasContent = true,
    required this.noteContent,
    required this.date,
    required this.deleteNoteMethod,
    this.leading = false,
    this.isCecked = false,
    required this.onChanged,
    
  });

  final String noteTitle;
  final bool hasContent;
  final String noteContent;
  final DateTime date;
  final void Function(BuildContext) deleteNoteMethod;
  final Function(bool?)? onChanged;
  final bool leading;
  final bool isCecked;

  @override
  State<NoteAndTodoItemCardSlidable> createState() =>
      _NoteAndTodoItemCardSlidableState();
}

class _NoteAndTodoItemCardSlidableState
    extends State<NoteAndTodoItemCardSlidable> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteNoteMethod,
              icon: Ionicons.ios_trash_outline,
              foregroundColor: Colors.red,
              backgroundColor: Colors.transparent,
              autoClose: true,
            ),
          ],
        ),
        child: PageStorage(
          bucket: PageStorageBucket(),
          child: NoteAndTodoItemCard(
            isCecked: widget.isCecked,
            leading: widget.leading,
            hasContent: widget.hasContent,
            noteTitle: widget.noteTitle,
            noteContent: widget.noteContent,
            date: widget.date,
            onChanged: widget.onChanged,
          ),
        ));
  }
}
