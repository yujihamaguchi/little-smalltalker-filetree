public class ChangeAddressTransaction extends ChangeEmployeeTransaction {
	private String itsAddress;

	public ChangeAddressTransaction(int empId, String address) {
		super(empId);
		itsAddress = address;
	}

	public void Change(Employee e) {
		e.SetAddress(itsAddress);
	}
}
