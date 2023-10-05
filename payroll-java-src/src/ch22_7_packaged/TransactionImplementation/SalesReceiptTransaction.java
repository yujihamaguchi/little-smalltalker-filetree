package TransactionImplementation;

import java.util.Calendar;

import PayrollDatabase.GlobalDatabase;
import PayrollDomain.Employee;
import PayrollDomain.PaymentClassification;
import PayrollImplementation.CommissionedClassification;
import TransactionApplication.Transaction;

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
		Employee e = GlobalDatabase.payrollDB.GetEmployee(itsEmpId);
		if (e != null) {
			PaymentClassification pc = e.GetClassification();
			if (pc instanceof CommissionedClassification) {
				CommissionedClassification cc = (CommissionedClassification) pc;
				cc.AddReceipt(itsSaleDate, itsAmount);
			} else {
				throw new RuntimeException("Tried to add sales receipt to non-commissioned employee");
			}
		} else {
			throw new RuntimeException("No such employee.");
		}
	}
}
