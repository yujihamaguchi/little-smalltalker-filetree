import java.util.Calendar;

public class SalesReceiptTransaction implements Transaction {
	private Calendar itsSaleDate;
	private double itsAmount;
	private int itsEmpId;

	public SalesReceiptTransaction(Calendar saleDate, double amount, int empId) {
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
				throw new RuntimeException("Tried to add sales receipt to non-commissioned employee");
			}
		} else {
			throw new RuntimeException("No such employee.");
		}
	}
}
