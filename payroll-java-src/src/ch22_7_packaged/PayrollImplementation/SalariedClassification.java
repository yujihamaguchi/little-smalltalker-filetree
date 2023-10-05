package PayrollImplementation;

import PayrollDomain.PaymentClassification;
import PayrollDomain.Paycheck;

public class SalariedClassification implements PaymentClassification {
	private double itsSalary;

	public SalariedClassification(double salary) {
		itsSalary = salary;
	}

	public double GetSalary() {
		return itsSalary;
	}

	public double CalculatePay(Paycheck pc) {
		return itsSalary;
	}
}
