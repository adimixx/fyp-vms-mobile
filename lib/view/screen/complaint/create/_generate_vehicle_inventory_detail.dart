part of 'complaint_create_screen.dart';

class _GenerateVehicleInventoryDetail extends StatelessWidget {
  const _GenerateVehicleInventoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComplaintCreateBloc, ComplaintCreateState>(
      builder: (context, state) {
        if (state.vehicleInventory?.props.isNotEmpty ?? false) {
          return VehicleInventoryDetail(
              vehicleInventory: state.vehicleInventory!);
        }
        return Container();
      },
    );
  }
}
