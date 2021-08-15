part of 'complaint_create_screen.dart';

class _ComplaintForm extends StatefulWidget {
  _ComplaintForm({Key? key}) : super(key: key);

  @override
  __ComplaintFormState createState() => __ComplaintFormState();
}

class __ComplaintFormState extends State<_ComplaintForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late BuildContext _context;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      _context.read<ComplaintCreateBloc>().add(
            ComplaintSubmit(
                title: _titleController.text,
                description: _descriptionController.text),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return BlocBuilder<ComplaintCreateBloc, ComplaintCreateState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Complaint Title',
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                child: BsTextField(
                  enabled: !state.isSubmit,
                  borderRadius: 10,
                  controller: _titleController,
                  // labelText: "Complaint Title",
                  validator: BlocProvider.of<ComplaintCreateBloc>(context)
                      .titleInputValidator,
                ),
                margin: EdgeInsets.only(bottom: 20, top: 10),
              ),
              Text(
                'Complaint Description',
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                child: BsTextField(
                  enabled: !state.isSubmit,
                  borderRadius: 10,
                  maxLength: 250,
                  maxLines: 8,
                  controller: _descriptionController,
                  // labelText: "Complaint Title",
                  validator: BlocProvider.of<ComplaintCreateBloc>(context)
                      .descriptionInputValidator,
                ),
                margin: EdgeInsets.only(bottom: 20, top: 10),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  child: (state.isSubmit)
                      ? SpinKitRing(
                          color: Colors.white,
                          size: 20.0,
                          lineWidth: 3.0,
                        )
                      : Text('Submit Complaint'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                  onPressed: state.isSubmit ? null : onSubmit,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
