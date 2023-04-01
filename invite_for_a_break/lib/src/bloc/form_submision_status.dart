abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmittingStatus extends FormSubmissionStatus {
  const FormSubmittingStatus();
}

class SubmissionSuccessStatus extends FormSubmissionStatus {
  const SubmissionSuccessStatus();
}

class SubmissionFailedStatus extends FormSubmissionStatus {
  final String errorMesssage;

  const SubmissionFailedStatus(this.errorMesssage);
}
