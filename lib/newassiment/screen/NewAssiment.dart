import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NewAssignmentPage extends StatefulWidget {
  @override
  _NewAssignmentPageState createState() => _NewAssignmentPageState();
}

class _NewAssignmentPageState extends State<NewAssignmentPage> {
  final _formKey = GlobalKey<FormState>();
  final _primaryColor = Color(0xFF6C56F9); // Modern purple
  final _secondaryColor = Color(0xFFF8F7FF); // Light purple background
  final _accentColor = Color(0xFFF9A826); // Orange for accents
  final _textColor = Color(0xFF2D3748); // Dark gray for text
  final _hintColor = Color(0xFF718096); // Gray for hints

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  DateTime? _startTime;
  DateTime? _endTime;
  String _examDuration = "";
  File? _logoFile;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _logoFile = File(picked.path);
      });
    }
  }

  void _calculateDuration() {
    if (_startTime != null && _endTime != null) {
      final duration = _endTime!.difference(_startTime!);
      if (duration.inMinutes > 0) {
        setState(() {
          _examDuration = "${duration.inMinutes} minutes";
        });
      } else {
        setState(() {
          _examDuration = "";
        });
      }
    }
  }

  Future<void> _selectDateTime(bool isStart) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: _primaryColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: _textColor,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: _primaryColor,
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: _textColor,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        },
      );

      if (pickedTime != null) {
        final combined = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          if (isStart) {
            _startTime = combined;
          } else {
            _endTime = combined;
          }
          _calculateDuration();
        });
      }
    }
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;
    if (_logoFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please upload assignment image'),
          backgroundColor: _accentColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }

    // Form submission logic
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd – HH:mm');
    return Scaffold(
      backgroundColor: _secondaryColor,
      appBar: AppBar(
        title: Text(
          "Create New Assignment",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: _primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: _primaryColor,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: _logoFile != null
                            ? ClipOval(
                                child: Image.file(
                                  _logoFile!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Icon(
                                Iconsax.gallery_add,
                                size: 40,
                                color: _primaryColor,
                              ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Upload Assignment Image",
                      style: TextStyle(
                        color: _hintColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Assignment Name',
                  labelStyle: TextStyle(color: _hintColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: _primaryColor, width: 2),
                  ),
                  prefixIcon: Icon(Iconsax.document_text, color: _hintColor),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(color: _textColor),
                validator: (value) =>
                    value!.isEmpty ? 'Required field' : null,
              ),
              SizedBox(height: 16),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TIME SETTINGS",
                        style: TextStyle(
                          color: _hintColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Iconsax.clock, size: 20, color: _primaryColor),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _startTime == null
                                  ? "Start Time: Not set"
                                  : "Start: ${dateFormat.format(_startTime!)}",
                              style: TextStyle(color: _textColor),
                            ),
                          ),
                          TextButton(
                            onPressed: () => _selectDateTime(true),
                            child: Text(
                              "SET",
                              style: TextStyle(
                                color: _primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: _primaryColor.withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Iconsax.clock, size: 20, color: _primaryColor),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _endTime == null
                                  ? "End Time: Not set"
                                  : "End: ${dateFormat.format(_endTime!)}",
                              style: TextStyle(color: _textColor),
                            ),
                          ),
                          TextButton(
                            onPressed: () => _selectDateTime(false),
                            child: Text(
                              "SET",
                              style: TextStyle(
                                color: _primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: _primaryColor.withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Iconsax.timer, size: 20, color: _primaryColor),
                          SizedBox(width: 12),
                          Text(
                            "Duration: ",
                            style: TextStyle(
                                color: _textColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _examDuration.isEmpty ? "Not calculated" : _examDuration,
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _pointsController,
                decoration: InputDecoration(
                  labelText: 'Points',
                  labelStyle: TextStyle(color: _hintColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: _primaryColor, width: 2),
                  ),
                  prefixIcon: Icon(Iconsax.star, color:Colors.yellow),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(color: _textColor),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Required field' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _instructionsController,
                decoration: InputDecoration(
                  labelText: 'Instructions',
                  labelStyle: TextStyle(color: _hintColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: _primaryColor, width: 2),
                  ),
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(color: _textColor),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? 'Required field' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Assignment Content',
                  labelStyle: TextStyle(color: _hintColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: _primaryColor, width: 2),
                  ),
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(color: _textColor),
                maxLines: 5,
                validator: (value) =>
                    value!.isEmpty ? 'Required field' : null,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Iconsax.add_square, size: 24 , color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "CREATE ASSIGNMENT",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  shadowColor: _primaryColor.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}