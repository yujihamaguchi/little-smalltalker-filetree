public class MailMethod implements PaymentMethod {
	private String itsAddress;

	public MailMethod(String address) {
		itsAddress = address;
	}

	public String GetAddress() {
		return itsAddress;
	}
}
