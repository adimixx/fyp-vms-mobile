part of 'complaint_create_bloc.dart';

class ComplaintCreateState extends Equatable {
  const ComplaintCreateState._(
      {this.vehicleInventory,
      this.isSubmit = false,
      required this.titleController,
      required this.descriptionController,
      required this.formKey});

  const ComplaintCreateState.init(
      {required titleController,
      required descriptionController,
      required formKey})
      : this._(
            titleController: titleController,
            descriptionController: descriptionController,
            formKey: formKey);

  const ComplaintCreateState.withVehicleData(
      {required VehicleInventory vehicleInventory,
      required titleController,
      required descriptionController,
      required formKey})
      : this._(
            vehicleInventory: vehicleInventory,
            titleController: titleController,
            descriptionController: descriptionController,
            formKey: formKey);

  const ComplaintCreateState.changeFormState(
      {required VehicleInventory vehicleInventory,
      required titleController,
      required descriptionController,
      required formKey,
      required isSubmit})
      : this._(
            vehicleInventory: vehicleInventory,
            titleController: titleController,
            descriptionController: descriptionController,
            formKey: formKey,
            isSubmit: isSubmit);

  final VehicleInventory? vehicleInventory;
  final bool isSubmit;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;

  @override
  List<Object?> get props => [
        vehicleInventory,
        isSubmit,
        titleController,
        descriptionController,
        formKey
      ];
}
