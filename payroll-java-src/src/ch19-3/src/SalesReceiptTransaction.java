public class SalesReceiptTransaction implements Transaction {
	private long itsSaleDate;
	private double itsAmount;
	private int itsEmpId;

	public SalesReceiptTransaction(long saleDate, double amount, int empId) {
		itsSaleDate = saleDate;
		itsAmount = amount;
		itsEmpId = empId;
	}

	public void Execute() {
		Employee e = PayrollDatabase.GetEmployee(itsEmpId);
		if (e != null) {
			PaymentClassification pc = e.GetClassification();
			if (pc instanceof CommissionedClassification) {
				CommissionedClassification cc = (CommissionedClassification) pc;
				cc.AddReceipt(new SalesReceipt(itsSaleDate, itsAmount));
			} else {
				System.err.println("Tried to add sales receipt to non-commissioned employee");
			}
		} else {
			System.err.println("No such employee.");
		}
	}
}
