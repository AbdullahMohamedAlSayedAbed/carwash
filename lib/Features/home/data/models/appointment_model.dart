class AppointmentItemModel {
  final String title, description, image, buttonText;
  final void Function()? onPressed;

    AppointmentItemModel(
      {required this.title,
      required this.description,
      required this.image,
      required this.buttonText,
       this.onPressed});
}
