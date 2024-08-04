import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:intl/intl.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class NoteAndTodoItemCard extends StatefulWidget {
  const NoteAndTodoItemCard({
    super.key,
    required this.noteTitle,
    this.hasContent = true,
    required this.noteContent,
    required this.date,
    this.leading = false,
    this.isCecked = false,
    required this.onChanged,
  });

  final String noteTitle;
  final bool hasContent;
  final String noteContent;
  final DateTime date;
  final bool leading;
  final bool isCecked;
  final Function(bool?)? onChanged;

  @override
  State<NoteAndTodoItemCard> createState() => _NoteAndTodoItemCardState();
}

class _NoteAndTodoItemCardState extends State<NoteAndTodoItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: widget.leading
              ? MSHCheckbox(
                  size: 30,
                  value: widget.isCecked,
                  colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                    checkedColor: Colors.blue,
                  ),
                  style: MSHCheckboxStyle.values[0],
                  onChanged: widget.onChanged!,
                  duration: Duration(milliseconds: 300),
                )
              : null,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.noteTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              widget.hasContent
                  ? Text(
                      widget.noteContent,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  : const SizedBox(width: 0, height: 0)
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Edited : ${DateFormat('EEE MMM d, yyyy h:mm a').format(widget.date)}',
              style: TextStyle(fontSize: 12),
            ),
          ),
          trailing: Icon(
            Ionicons.ios_create_outline,
            color: Colors.blue,
            size: 30,
          ),
        ),
      ),
    );
  }
}
