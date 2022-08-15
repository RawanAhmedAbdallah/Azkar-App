import 'package:flutter/material.dart';
import 'package:azkar_app/models/note.dart';
import 'package:azkar_app/models/process_response.dart';
import 'package:azkar_app/preferences/shared_pref_controller.dart';
import 'package:azkar_app/provider/note_provider.dart';
import 'package:azkar_app/utils/helpers.dart';
import 'package:azkar_app/widgets/app_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class NoteScreen extends StatefulWidget {
   const NoteScreen({Key? key,this.note});

  final Note? note;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> with Helpers{
  late TextEditingController _titleTextController;
  late TextEditingController _infoTextController;


  @override
  void initState() {
    super.initState();
    _titleTextController = TextEditingController(text: widget.note?.title);
    _infoTextController = TextEditingController(text:widget.note?.info);

  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _infoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFEFBF6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF876445),
        title: Text(title,style: GoogleFonts.tajawal(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
              style: GoogleFonts.tajawal(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF876445),
              ),
            ),
            Text(AppLocalizations.of(context)!.note_hint,
              style: GoogleFonts.tajawal(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF876445),
              ),),
            const SizedBox(height: 20,),
            AppTextField(textController: _titleTextController,
              hint:AppLocalizations.of(context)!.title,
              prefixIcon: Icons.title,
            ),
            const SizedBox(height: 10,),
            AppTextField(textController: _infoTextController,
              hint: AppLocalizations.of(context)!.info,
              prefixIcon: Icons.info,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed:() async => await _performSave(),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF876445),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),

                  ),
              ),
              child: Text(AppLocalizations.of(context)!.save, style: GoogleFonts.tajawal(),
            ),
            ),
          ],
        ),
      ),
    );
  }

  String get title {
    return isNewNote
        ? AppLocalizations.of(context)!.new_note
        : AppLocalizations.of(context)!.update_note;
  }

  bool get isNewNote => widget.note == null;

  Future<void> _performSave() async {
    if (_checkData()) {
      await _save();
    }
  }

  bool _checkData() {
    if (_titleTextController.text.isNotEmpty &&
        _infoTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _save() async {
    ProcessResponse processResponse = isNewNote
        ? await Provider.of<NoteProvider>(context, listen: false)
        .create(note: note)
        : await Provider.of<NoteProvider>(context, listen: false)
        .update(updatedNote: note);

    showSnackBar(context,
        message: processResponse.message, error: !processResponse.success);
    if (processResponse.success) {
      isNewNote ? clear() : Navigator.pop(context);
    }
  }

  Note get note {
    Note note = isNewNote ? Note() : widget.note!;
    note.title = _titleTextController.text;
    note.info = _infoTextController.text;
    note.userId =
    SharedPrefController().getValueFor<int>(key: PrefKeys.id.name)?? -1;
    return note;
  }


  void clear() {
    _titleTextController.clear();
    _infoTextController.clear();
  }
}
