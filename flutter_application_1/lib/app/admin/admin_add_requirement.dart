import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For jsonDecode
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_1/handle_request.dart';

class AdminAddRequirementScreen extends StatefulWidget {
  @override
  _AdminAddRequirementScreenState createState() =>
      _AdminAddRequirementScreenState();
}

class _AdminAddRequirementScreenState extends State<AdminAddRequirementScreen> {
  final _formKey = GlobalKey<FormState>(); // To handle form validation
  TextEditingController _requirementNameController = TextEditingController();
  TextEditingController _deadlineController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  File? selectedFile;

  // Future<void> _pickFile(BuildContext context) async {
  //   // Open the file picker dialog
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     // If a file was selected, update the controller with the file name
  //     _fileController.text = result.files.single.name;
  //   } else {
  //     // If no file is selected
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('No file selected')),
  //     );
  //   }
  // }

  // Method to pick the date for the deadline
  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate, // Disable previous dates
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        _deadlineController.text =
            '${picked.toLocal()}'.split(' ')[0]; // Format the date
      });
    }
  }

  // Method to pick the time
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      final now = TimeOfDay.now();
      if (picked.hour < now.hour ||
          (picked.hour == now.hour && picked.minute < now.minute)) {
        // If the picked time is earlier than the current time
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a future time')),
        );
        return; // Exit the function without updating the time
      }
      setState(() {
        _timeController.text = picked.format(context); // Format the time
      });
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file selected.')),
      );
    }
  }

  // Method to handle form submission
  void _submitForm() {
    // if (_formKey.currentState!.validate()) {
    //   // Form is valid, process the data
    //   String requirementName = _requirementNameController.text;
    //   String deadline = _deadlineController.text;
    //   String time = _timeController.text;

    //   FilePickerResult? result = await FilePicker.platform.pickFiles();

    // if (result != null && result.files.single.path != null) {
    //   setState(() {
    //     selectedFile = File(result.files.single.path!);
    //   });
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('No file selected.')),
    //   );
    // }
    // }
    uploadFile();
  }

  void uploadFile() async {
    if (selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a file to upload.')),
      );
      return;
    }

    try {
      // Prepare the file for upload
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://192.168.100.111:8888/.netlify/functions/api/file/upload-file'));
      request.files
          .add(await http.MultipartFile.fromPath('file', selectedFile!.path));

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['success']) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('File uploaded: ${responseData['uploadedDocument']}')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Upload failed: ${responseData['message']}')),
          );
        }
      } else {
        throw Exception(
            'Failed to upload file. Status code: ${response.statusCode}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Requirement'),
        backgroundColor: Colors.blue, // AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Attach the form key
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Requirement Name
                TextFormField(
                  controller: _requirementNameController,
                  decoration: InputDecoration(labelText: 'Requirement Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a requirement name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Deadline Date
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _deadlineController,
                      decoration: InputDecoration(
                        labelText: 'Deadline Date',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a deadline date';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _pickFile,
                  child: const Text('Select File'),
                ),
                if (selectedFile != null) ...[
                  Text('Selected File: ${selectedFile!.path}'),
                  const SizedBox(height: 16),
                ],

                const SizedBox(height: 20),

                // Deadline Time
                GestureDetector(
                  onTap: () => _selectTime(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _timeController,
                      decoration: const InputDecoration(
                        labelText: 'Deadline Time',
                        suffixIcon: Icon(Icons.access_time),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a deadline time';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Submit Button
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Add Requirement'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent, // Button color
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
