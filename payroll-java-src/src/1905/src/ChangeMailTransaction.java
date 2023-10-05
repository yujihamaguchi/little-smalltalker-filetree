public class ChangeMailTransaction extends ChangeMethodTransaction {
	private String itsAddress;

	public ChangeMailTransaction(int empId, String address) {
		super(empId);
		itsAddress = address;
	}

	PaymentMethod GetMethod() {
		return new MailMethod(itsAddress);
	}
}
