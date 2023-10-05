package PayrollImplementation;

import java.util.Calendar;

import PayrollDomain.Paycheck;

public class PaycheckImplementation implements Paycheck {
	private Calendar itsPayPeriodStartDate;
	private Calendar itsPayPeriodEndDate;
	private double itsGrossPay;
	private double itsDeductions;
	private double itsNetPay;

	public PaycheckImplementation(Calendar payPeriodStartDate, Calendar payPeriodEndDate) {
		itsPayPeriodStartDate = payPeriodStartDate;
		itsPayPeriodEndDate = payPeriodEndDate;
	}

	public Calendar GetPayPeriodStartDate() {
		return itsPayPeriodStartDate;
	}

	public Calendar GetPayPeriodEndDate() {
		return itsPayPeriodEndDate;
	}

	public double GetGrossPay() {
		return itsGrossPay;
	}

	public void SetGrossPay(double grossPay) {
		itsGrossPay = grossPay;
	}

	public String GetField(String string) {
		if (string.equals("Disposition")) {
			return "Hold";
		}
		return null;
	}

	public double GetDeductions() {
		return itsDeductions;
	}

	public void SetDeductions(double deductions) {
		itsDeductions = deductions;
	}

	public double GetNetPay() {
		return itsNetPay;
	}

	public void SetNetPay(double netPay) {
		itsNetPay = netPay;
	}
}
