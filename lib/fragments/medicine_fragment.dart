import 'package:flutter/material.dart';
import 'package:shop_manager/fragments/fragment.dart';

class MedicineFragment extends Fragment {
  const MedicineFragment(super.parentState, {super.key});

  @override
  State<MedicineFragment> createState() => _MedicineFragmentState();
  
  @override
  void optionPressed() {
  }
}

class _MedicineFragmentState extends State<MedicineFragment> {
  @override
  Widget build(BuildContext context) {
    return const Text("Medicaments");
  }

  @override
  void initState() {
    super.initState();
  }
}
