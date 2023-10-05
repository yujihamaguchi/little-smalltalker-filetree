package TransactionImplementation;

import AbstractTransacions.ChangeClassificationTransaction;
import PayrollDomain.PaymentClassification;
import PayrollDomain.PaymentSchedule;
import PayrollFactory.PayrollFactory;

public class ChangeHourlyTransaction extends ChangeClassificationTransaction {
	private double itsRate;
	private PayrollFactory itsPayrollFactory;

	public ChangeHourlyTransaction(int empId, double rate, PayrollFactory payrollFactory) {
		super(empId);
		itsRate = rate;
		itsPayrollFactory = payrollFactory;
	}

	public PaymentSchedule GetSchedule() {
		return itsPayrollFactory.makeWeeklySchedule();
	}

	public PaymentClassification GetClassification() {
		return itsPayrollFactory.makeHourlyClassification(itsRate);
	}
}
