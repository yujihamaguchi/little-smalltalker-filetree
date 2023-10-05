public class MailMethod implements PaymentMethod {
	private String itsAddress;

	public MailMethod(String address) {
		itsAddress = address;
	}

	public String GetAddress() {
		return itsAddress;
	}

	public void Pay(Paycheck pc) {
		// TODO Auto-generated method stub
	}
}
