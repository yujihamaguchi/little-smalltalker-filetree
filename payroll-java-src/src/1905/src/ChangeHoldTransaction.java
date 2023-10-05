public class ChangeHoldTransaction extends ChangeMethodTransaction {
	public ChangeHoldTransaction(int empId) {
		super(empId);
	}

	PaymentMethod GetMethod() {
		return new HoldMethod();
	}
}
