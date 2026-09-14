import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Input',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // Checkbox
  bool isChecked = false;

  // Switch
  bool isSwitchOn = false;

  // Dropdown
  String selectedOption = 'Option 1';

  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  // Tanggal dan Jam
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Pilih Tanggal
  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Pilih Jam
  Future<void> pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // Format Tanggal
  String get formattedDate {
    if (selectedDate == null) {
      return 'Belum dipilih';
    }

    return '${selectedDate!.day.toString().padLeft(2, '0')}/'
        '${selectedDate!.month.toString().padLeft(2, '0')}/'
        '${selectedDate!.year}';
  }

  // Format Jam
  String get formattedTime {
    if (selectedTime == null) {
      return 'Belum dipilih';
    }

    return '${selectedTime!.hour.toString().padLeft(2, '0')}:'
        '${selectedTime!.minute.toString().padLeft(2, '0')}';
  }

  // Drawer Item
  Widget drawerItem({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return ExpansionTile(
      leading: Icon(icon),
      title: Text(title),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
      children: [child, const SizedBox(height: 8)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =====================
      // APP BAR
      // =====================
      appBar: AppBar(
        title: const Text('Form Input Pengguna'),
        centerTitle: true,
      ),

      // =====================
      // DRAWER
      // =====================
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle, color: Colors.white, size: 60),
                  SizedBox(height: 10),
                  Text(
                    'Menu Form',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),

            // Checkbox Drawer
            drawerItem(
              icon: Icons.check_box,
              title: 'Checkbox',
              child: CheckboxListTile(
                title: const Text('Aktifkan Checkbox'),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),
            ),

            // Switch Drawer
            drawerItem(
              icon: Icons.toggle_on,
              title: 'Switch',
              child: SwitchListTile(
                title: const Text('Aktifkan Switch'),
                value: isSwitchOn,
                onChanged: (value) {
                  setState(() {
                    isSwitchOn = value;
                  });
                },
              ),
            ),

            // Dropdown Drawer
            drawerItem(
              icon: Icons.arrow_drop_down_circle,
              title: 'Dropdown',
              child: DropdownButton<String>(
                value: selectedOption,
                isExpanded: true,
                items: options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),

            // Tanggal Drawer
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Tanggal'),
              subtitle: Text(formattedDate),
              onTap: pickDate,
            ),

            // Jam Drawer
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Jam'),
              subtitle: Text(formattedTime),
              onTap: pickTime,
            ),
          ],
        ),
      ),

      // =====================
      // BODY
      // =====================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Form Input',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // =====================
            // CHECKBOX
            // =====================
            Card(
              child: CheckboxListTile(
                title: const Text('Checkbox'),
                subtitle: Text(
                  isChecked ? 'Checkbox aktif' : 'Checkbox tidak aktif',
                ),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),
            ),

            const SizedBox(height: 10),

            // =====================
            // SWITCH
            // =====================
            Card(
              child: SwitchListTile(
                title: const Text('Switch'),
                subtitle: Text(
                  isSwitchOn ? 'Switch aktif' : 'Switch tidak aktif',
                ),
                value: isSwitchOn,
                onChanged: (value) {
                  setState(() {
                    isSwitchOn = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 10),

            // =====================
            // DROPDOWN
            // =====================
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: DropdownButtonFormField<String>(
                  value: selectedOption,
                  decoration: const InputDecoration(
                    labelText: 'Pilih Option',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.list),
                  ),
                  items: options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            // =====================
            // TOMBOL PILIH TANGGAL
            // =====================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: pickDate,
                icon: const Icon(Icons.calendar_today),
                label: const Text('Pilih Tanggal'),
              ),
            ),

            const SizedBox(height: 10),

            // =====================
            // TOMBOL PILIH JAM
            // =====================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: pickTime,
                icon: const Icon(Icons.access_time),
                label: const Text('Pilih Jam'),
              ),
            ),

            const SizedBox(height: 30),

            // =====================
            // HASIL
            // =====================
            const Text(
              'Hasil Pilihan Pengguna',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.check_box),
                      title: const Text('Checkbox'),
                      trailing: Text(isChecked ? 'Aktif' : 'Tidak Aktif'),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.toggle_on),
                      title: const Text('Switch'),
                      trailing: Text(isSwitchOn ? 'ON' : 'OFF'),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.list),
                      title: const Text('Dropdown'),
                      trailing: Text(selectedOption),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: const Text('Tanggal'),
                      trailing: Text(formattedDate),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.access_time),
                      title: const Text('Jam'),
                      trailing: Text(formattedTime),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
