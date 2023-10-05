package TransactionImplementation;

import java.util.Calendar;

import PayrollDatabase.GlobalDatabase;
import PayrollDomain.Employee;
import PayrollDomain.PaymentClassification;
import PayrollImplementation.HourlyClassification;
import TransactionApplication.Transaction;

public class TimeCardTransaction implements Transaction {
	private Calendar itsDate;
	private double itsHours;
	private int itsEmpId;

	public TimeCardTransaction(Calendar date, double hours, int empId) {
		itsDate = date;
		itsHours = hours;
		itsEmpId = empId;
	}

	public void Execute() {
		Employee e = GlobalDatabase.payrollDB.GetEmployee(itsEmpId);
		if (e != null) {
			PaymentClassification pc = e.GetClassification();
			if (pc instanceof HourlyClassification) {
				HourlyClassification hc = (HourlyClassification) pc;
				hc.AddTimeCard(itsDate, itsHours);
			} else {
				throw new RuntimeException("Tried to add timecard to non-hourly employee.");
			}
		} else {
			throw new RuntimeException("No such employee.");
		}
	}
}
